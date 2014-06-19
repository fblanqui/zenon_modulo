#  Copyright 1997 INRIA

# Reading configuration settings.
include .config_var
# Variables CAMLBYT, CAMLBIN, CAMLLEX, CAMLYACC CAMLDEP, COQC, etc. are
# defined at configuration time, and their value is recorded in .config_var

# Staging directory for package managers
DESTDIR =

CAMLFLAGS = -warn-error "$(WARN_ERROR)" -I `ocamlfind query zarith`

CAMLBINFLAGS = $(CAMLFLAGS) $(BIN_DEBUG_FLAGS)
CAMLBYTFLAGS = $(CAMLFLAGS) $(BYT_DEBUG_FLAGS)

# SOURCES specifies both the list of source files and the set of
# modules in linking order.

SOURCES = log.ml version.ml config.dummy misc.ml heap.ml globals.ml error.ml \
          progress.ml namespace.ml type.ml expr.ml \
          phrase.ml llproof.ml mlproof.ml watch.ml eqrel.ml index.ml \
	  print.ml step.ml node.ml extension.ml mltoll.ml \
          parsezen.mly lexzen.mll \
	  parsetptp.mly lextptp.mll typetptp.ml \
          parsecoq.mly lexcoq.mll tptp.ml \
          coqterm.ml lltocoq.ml \
          enum.ml isar_case.ml lltoisar.ml \
          printBox.ml simplex.ml arith.ml \
          ext_focal.ml ext_tla.ml ext_recfun.ml \
          ext_equiv.ml ext_induct.ml ext_arith.ml \
          prove.ml checksum.dummy versionnum.ml main.ml zenon.ml

COQSRC = zenon.v zenon_coqbool.v zenon_equiv.v zenon_induct.v zenon_focal.v

DOCSRC =

TESTSRC =

OTHERSRC = INSTALL LICENSE Makefile configure .config_var.in .depend

MLSRC = $(SOURCES:%.dummy=)

MLISRC1 = $(SOURCES:%.mly=)
MLISRC2 = $(MLISRC1:%.mll=%.mli)
MLISRC3 = $(MLISRC2:%.dummy=%.mli)
MLISRC = $(MLISRC3:%.ml=%.mli)

ALLSRC = $(MLSRC) $(MLISRC) $(COQSRC) $(DOCSRC) $(TESTSRC) $(OTHERSRC)


MODULES1 = $(SOURCES:%.ml=%)
MODULES2 = $(MODULES1:%.mly=%)
MODULES3 = $(MODULES2:%.mll=%)
MODULES = $(MODULES3:%.dummy=%)

IMPL = $(MODULES:%=%.ml)
INTF = $(MODULES:%=%.mli)
BYTOBJS = $(MODULES:%=%.cmo)
BINOBJS = $(MODULES:%=%.cmx)

COQOBJ = $(COQSRC:%.v=%.vo)

.PHONY: all byt bin coq

all: byt bin zenon coq

coq: $(COQOBJ)

byt: zenon.byt

bin: zenon.bin

zenon.bin: $(BINOBJS)
	$(CAMLBIN) $(CAMLBINFLAGS) -o zenon.bin unix.cmxa zarith.cmxa $(BINOBJS)

zenon.byt: $(BYTOBJS)
	$(CAMLBYT) $(CAMLBYTFLAGS) -o zenon.byt unix.cma zarith.cma $(BYTOBJS)

zenon: zenon.byt
	if test -x zenon.bin; then \
	  cp zenon.bin zenon; \
        else \
	  cp zenon.byt zenon; \
	fi


.PHONY: install
install:
	mkdir -p "$(DESTDIR)$(INSTALL_BIN_DIR)"
	cp zenon "$(DESTDIR)$(INSTALL_BIN_DIR)/"
	mkdir -p "$(DESTDIR)$(INSTALL_LIB_DIR)"
	cp $(COQSRC) "$(DESTDIR)$(INSTALL_LIB_DIR)/"
	for i in $(COQOBJ); \
	  do [ ! -f $$i ] || cp $$i "$(DESTDIR)$(INSTALL_LIB_DIR)/"; \
	done

.PHONY: uninstall
uninstall:
	rm -f "$(DESTDIR)$(BIN_DIR)/zenon$(EXE)"
	rm -rf "$(DESTDIR)$(LIB_DIR)/zenon"

.SUFFIXES: .ml .mli .cmo .cmi .cmx .v .vo

.ml.cmo:
	$(CAMLBYT) $(CAMLBYTFLAGS) -c $*.ml

.ml.cmx:
	$(CAMLBIN) $(CAMLBINFLAGS) -c $*.ml

.mli.cmi:
	$(CAMLBYT) $(CAMLBYTFLAGS) -c $*.mli

lexzen.ml: lexzen.mll
	$(CAMLLEX) lexzen.mll

parsezen.ml: parsezen.mly
	$(CAMLYACC) -v parsezen.mly

parsezen.mli: parsezen.ml
	:

lextptp.ml: lextptp.mll
	$(CAMLLEX) lextptp.mll

parsetptp.ml: parsetptp.mly
	$(CAMLYACC) -v parsetptp.mly

parsetptp.mli: parsetptp.ml
	:

lexcoq.ml: lexcoq.mll
	$(CAMLLEX) lexcoq.mll

parsecoq.ml: parsecoq.mly
	$(CAMLYACC) -v parsecoq.mly

parsecoq.mli: parsecoq.ml
	:

config.ml: .config_var
	echo '(* This file is automatically generated. *)' >config.ml.tmp
	echo 'let libdir = "$(INSTALL_LIB_DIR)";;' >> config.ml.tmp
	if ! cmp -s config.ml config.ml.tmp; then cp config.ml.tmp config.ml; fi
	rm -f config.ml.tmp

checksum.ml: $(IMPL:checksum.ml=)
	echo '(* This file is automatically generated. *)' >checksum.ml
	echo 'let v = "'`$(SUM) $(IMPL) | $(SUM)`'";;' >>checksum.ml

.v.vo:
	$(COQC) -q $*.v

.PHONY: dist
dist: $(ALLSRC)
	mkdir -p dist/zenon
	cp $(ALLSRC) dist/zenon
	cd dist && tar cf - zenon | gzip >../zenon.tar.gz

.PHONY: doc odoc docdir
doc docdir:
	(cd doc && $(MAKE) $@)

.PHONY: clean
clean:
	cd doc; make clean
	[ ! -d test ] || (cd test; make clean)
	rm -f .#*
	rm -f *.cm* *.o *.vo *.annot *.output *.glob
	rm -f parsezen.ml parsezen.mli lexzen.ml
	rm -f parsetptp.ml parsetptp.mli lextptp.ml
	rm -f parsecoq.ml parsecoq.mli lexcoq.ml
	rm -f checksum.ml
	rm -f zenon *.bin *.byt
	rm -rf dist zenon.tar.gz

.PHONY: depend
depend: $(IMPL) $(INTF) $(COQSRC)
	$(CAMLDEP) $(IMPL) $(INTF) >.depend
	$(COQDEP) -I . $(COQSRC) >>.depend

include .depend
