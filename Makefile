#  Copyright 1997 INRIA
#  $Id: Makefile,v 1.49 2008-10-22 11:51:04 doligez Exp $

CAMLFLAGS = -warn-error A

CAMLOPT = ocamlopt
CAMLOPTFLAGS = ${CAMLFLAGS} ${OPTDEBUGFLAGS}

CAMLC = ocamlc
CAMLCFLAGS = ${CAMLFLAGS} ${BYTDEBUGFLAGS}

CAMLLEX = ocamllex
CAMLYACC = ocamlyacc


# SOURCES specifies both the list of source files and the set of
# modules in linking order.

SOURCES = version.ml config.dummy misc.ml heap.ml globals.ml error.ml \
          progress.ml namespace.ml expr.ml \
          phrase.ml llproof.ml mlproof.ml watch.ml eqrel.ml index.ml \
          print.ml step.ml node.ml extension.ml mltoll.ml prove.ml \
          parsezen.mly lexzen.mll parsetptp.mly lextptp.mll \
          parsecoq.mly lexcoq.mll tptp.ml \
          ext_coqbool.ml ext_focal.ml ext_tla.ml \
          ext_equiv.ml ext_inductive.ml coqterm.ml lltocoq.ml \
          lltoisar.ml \
          checksum.dummy versionnum.ml main.ml

COQSRC = zenon.v zenon_coqbool.v zenon_equiv.v zenon_inductive.v  zenon_focal.v

DOCSRC = 

TESTSRC = 

OTHERSRC = INSTALL LICENSE Makefile configure .config_var.in .depend

MLSRC = ${SOURCES:%.dummy=}

MLISRC1 = ${SOURCES:%.mly=}
MLISRC2 = ${MLISRC1:%.mll=%.mli}
MLISRC3 = ${MLISRC2:%.dummy=%.mli}
MLISRC = ${MLISRC3:%.ml=%.mli}

ALLSRC = ${MLSRC} ${MLISRC} ${COQSRC} ${DOCSRC} ${TESTSRC} ${OTHERSRC}


MODULES1 = ${SOURCES:%.ml=%}
MODULES2 = ${MODULES1:%.mly=%}
MODULES3 = ${MODULES2:%.mll=%}
MODULES = ${MODULES3:%.dummy=%}

IMPL = ${MODULES:%=%.ml}
INTF = ${MODULES:%=%.mli}
OBJBYT = ${MODULES:%=%.cmo}
OBJOPT = ${MODULES:%=%.cmx}

COQOBJ = ${COQSRC:%.v=%.vo}

include .config_var

.PHONY: all
all: byt opt coq zenon

coq: ${COQOBJ}

byt: zenon.byt

opt: zenon.opt

zenon.opt: ${OBJOPT}
	${CAMLOPT} ${CAMLOPTFLAGS} -o zenon.opt ${OBJOPT}

zenon.byt: ${OBJBYT}
	${CAMLC} ${CAMLCFLAGS} -o zenon.byt ${OBJBYT}


zenon: zenon.byt
	if test -x zenon.opt; then \
	  cp zenon.opt zenon; \
        else \
	  cp zenon.byt zenon; \
	fi

.PHONY: install
install:
	mkdir -p "${DESTDIR}${BINDIR}"
	cp zenon "${DESTDIR}${BINDIR}"/
	mkdir -p "${DESTDIR}${LIBDIR}"
	cp ${COQSRC} "${DESTDIR}${LIBDIR}"/
	for i in ${COQOBJ}; do [ ! -f $$i ] || cp $$i "${DESTDIR}${LIBDIR}";done

.PHONY: uninstall
uninstall:
	rm -f "${BINDIR}"/zenon
	cd "${LIBDIR}" && rm -f ${COQSRC} ${COQOBJ}

.SUFFIXES: .ml .mli .cmo .cmi .cmx .v .vo

.ml.cmo:
	${CAMLC} ${CAMLCFLAGS} -c $*.ml

.ml.cmx:
	${CAMLOPT} ${CAMLOPTFLAGS} -c $*.ml

.mli.cmi:
	${CAMLOPT} ${CAMLOPTFLAGS} -c $*.mli

lexzen.ml: lexzen.mll
	${CAMLLEX} lexzen.mll

parsezen.ml: parsezen.mly
	${CAMLYACC} -v parsezen.mly

parsezen.mli: parsezen.ml
	:

lextptp.ml: lextptp.mll
	${CAMLLEX} lextptp.mll

parsetptp.ml: parsetptp.mly
	${CAMLYACC} -v parsetptp.mly

parsetptp.mli: parsetptp.ml
	:

lexcoq.ml: lexcoq.mll
	${CAMLLEX} lexcoq.mll

parsecoq.ml: parsecoq.mly
	${CAMLYACC} -v parsecoq.mly

parsecoq.mli: parsecoq.ml
	:

config.ml: .config_var
	echo '(* This file is automatically generated. *)' >config.ml
	echo 'let libdir = "${LIBDIR}";;' >> config.ml

checksum.ml: ${IMPL:checksum.ml=}
	echo '(* This file is automatically generated. *)' >checksum.ml
	echo 'let v = "'`${SUM} ${IMPL} | ${SUM}`'";;' >>checksum.ml

.v.vo:
	${COQC} -q $*.v

.PHONY: dist
dist: ${ALLSRC}
	mkdir -p dist/zenon
	cp ${ALLSRC} dist/zenon
	cd dist && tar cf - zenon | gzip >../zenon.tar.gz

.PHONY: clean
clean:
	rm -f .#* config_var
	rm -f *.cmo *.cmi *.cmx *.o *.vo *.annot *.output
	rm -f parsezen.ml parsezen.mli lexzen.ml
	rm -f parsetptp.ml parsetptp.mli lextptp.ml
	rm -f parsecoq.ml parsecoq.mli lexcoq.ml
	rm -f checksum.ml
	rm -f zenon zenon.opt zenon.byt
	rm -rf dist zenon.tar.gz
	cd doc; make clean
	cd test; make clean

.PHONY: distclean
distclean: clean
	rm -f .config_var

.PHONY: depend
depend: ${IMPL} ${INTF}
	ocamldep ${CAMLP4} ${IMPL} ${INTF} >.depend
	coqdep ${COQSRC} >>.depend

include .depend
