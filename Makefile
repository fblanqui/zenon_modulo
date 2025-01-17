#  Copyright 1997 INRIA

# Reading configuration settings.
include .config_var
# Variables CAMLBYT, CAMLBIN, CAMLLEX, CAMLYACC CAMLDEP, COQC, etc. are
# defined at configuration time, and their value is recorded in .config_var

# Staging directory for package managers
DESTDIR =

CAMLFLAGS = -I +unix -I +str -warn-error "$(WARN_ERROR)"

CAMLBINFLAGS = $(CAMLFLAGS) $(BIN_DEBUG_FLAGS)
CAMLBYTFLAGS = $(CAMLFLAGS) $(BYT_DEBUG_FLAGS)

VERSION_MAJOR = $(shell grep 'let major' versionnum.ml | sed 's/let major = \([0-9]*\);;/\1/')
VERSION_MINOR = $(shell grep 'let minor' versionnum.ml | sed 's/let minor = \([0-9]*\);;/\1/')
VERSION_BUGFIX = $(shell grep 'let bugfix' versionnum.ml | sed 's/let bugfix = \([0-9]*\);;/\1/')
VERSION = $(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_BUGFIX)

# SOURCES specifies both the list of source files and the set of
# modules in linking order.

SOURCES = log.ml version.ml config.dummy misc.ml heap.ml globals.ml error.ml \
          progress.ml namespace.ml expr.ml \
          phrase.ml llproof.ml mlproof.ml index.ml print.ml \
	  watch.ml eqrel.ml \
	  rewrite.ml typer.ml \
	  step.ml node.ml extension.ml mltoll.ml \
	  CCVector.ml printBox.ml simplex.ml arith.ml \
          parsezen.mly lexzen.mll \
	  parsetptp.mly lextptp.mll typetptp.ml \
	  parsecoq.mly lexcoq.mll parsedk.mly lexdk.mll tptp.ml \
          coqterm.ml lltocoq.ml \
	  dkterm.ml dkprint.ml lltodk.ml \
	  lpprint.ml lltolp.ml \
          enum.ml isar_case.ml lltoisar.ml \
          ext_focal.ml ext_tla.ml ext_recfun.ml \
          ext_equiv.ml ext_induct.ml ext_arith.ml \
          prove.ml checksum.dummy versionnum.ml main.ml zenon.ml

COQSRC = zenon.v zenon_coqbool.v zenon_equiv.v zenon_induct.v zenon_focal.v zenon_arith.v zenon_arith_reals.v

DKSRC = cc.dk dk_bool.dk dk_logic.dk dk_tuple.dk basics_minimal.dk zen.dk zenon_focal.dk zenon.dk

DOCSRC =

TESTSRC =

OTHERSRC = README LICENSE Makefile configure .depend

MLSRC = $(SOURCES:%.dummy=)

MLISRC1 = $(SOURCES:%.mly=)
MLISRC2 = $(MLISRC1:%.mll=%.mli)
MLISRC3 = $(MLISRC2:%.dummy=%.mli)
MLISRC = $(MLISRC3:%.ml=%.mli)

ALLSRC = $(MLSRC) $(MLISRC) $(COQSRC) $(DKSRC) $(DOCSRC) $(TESTSRC) $(OTHERSRC) examples


MODULES1 = $(SOURCES:%.ml=%)
MODULES2 = $(MODULES1:%.mly=%)
MODULES3 = $(MODULES2:%.mll=%)
MODULES = $(MODULES3:%.dummy=%)

IMPL = $(MODULES:%=%.ml)
INTF = $(MODULES:%=%.mli)
BYTOBJS = $(MODULES:%=%.cmo)
BINOBJS = $(MODULES:%=%.cmx)

COQOBJ = $(COQSRC:%.v=%.vo)

DKOBJ = $(DKSRC:%.dk=%.dko)

.PHONY: all byt bin coq dk

all: byt bin zenon_modulo coq dk

coq: $(COQOBJ)

dk: $(DKOBJ)

byt: zenon_modulo.byt

bin: zenon_modulo.bin

zenon_modulo.bin: $(BINOBJS)
	$(CAMLBIN) $(CAMLBINFLAGS) -o zenon_modulo.bin unix.cmxa zarith.cmxa str.cmxa $(BINOBJS)

zenon_modulo.byt: $(BYTOBJS)
	$(CAMLBYT) $(CAMLBYTFLAGS) -o zenon_modulo.byt unix.cma zarith.cma str.cma $(BYTOBJS)

zenon_modulo: zenon_modulo.byt
	if test -x zenon_modulo.bin; then \
	  cp zenon_modulo.bin zenon_modulo; \
        else \
	  cp zenon_modulo.byt zenon_modulo; \
	fi


.PHONY: install
install:
	mkdir -p "$(DESTDIR)$(INSTALL_BIN_DIR)"
	cp zenon_modulo "$(DESTDIR)$(INSTALL_BIN_DIR)/"
	mkdir -p "$(DESTDIR)$(INSTALL_LIB_DIR)"
	cp $(COQSRC) "$(DESTDIR)$(INSTALL_LIB_DIR)/"
	for i in $(COQOBJ); \
	  do [ ! -f $$i ] || cp $$i "$(DESTDIR)$(INSTALL_LIB_DIR)/"; \
	done
	cp $(DKSRC) "$(DESTDIR)$(INSTALL_LIB_DIR)/"
	for i in $(DKOBJ); \
	  do [ ! -f $$i ] || cp $$i "$(DESTDIR)$(INSTALL_LIB_DIR)/"; \
	done

.PHONY: uninstall
uninstall:
	rm -f "$(DESTDIR)$(INSTALL_BIN_DIR)/zenon_modulo$(EXE)"
	rm -rf "$(DESTDIR)$(INSTALL_LIB_DIR)/zenon_modulo"

.SUFFIXES: .ml .mli .cmo .cmi .cmx .v .vo .dk .dko

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

lexsmtlib.ml: lexsmtlib.mll
	$(CAMLLEX) lextptp.mll

parsesmtlib.ml: parsesmtlib.mly
	$(CAMLYACC) -v parsetptp.mly

parsesmtlib.mli: parsesmtlib.ml
	:

lexcoq.ml: lexcoq.mll
	$(CAMLLEX) lexcoq.mll

parsecoq.ml: parsecoq.mly
	$(CAMLYACC) -v parsecoq.mly

parsecoq.mli: parsecoq.ml
	:

lexdk.ml: lexdk.mll
	$(CAMLLEX) lexdk.mll

parsedk.ml: parsedk.mly
	$(CAMLYACC) -v parsedk.mly

parsedk.mli: parsedk.ml
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

.dk.dko:
	$(DKCHECK) -e $*.dk

.PHONY: dist
dist: $(ALLSRC)
	rm -rf dist/zenon_modulo
	mkdir -p dist/zenon_modulo
	cp -r $(ALLSRC) dist/zenon_modulo
	cd dist && tar cf - zenon_modulo | gzip >../zenon_modulo_$(VERSION).tar.gz

.PHONY: doc odoc docdir
doc docdir:
	(cd doc && $(MAKE) $@)

.PHONY: clean
clean:
	[ ! -d test ] || (cd doc; make clean)
	[ ! -d test ] || (cd test; make clean)
	rm -f .#*
	rm -f *.cm* *.o *.vo *.dko *.annot *.output *.glob
	rm -f parsezen.ml parsezen.mli lexzen.ml
	rm -f parsetptp.ml parsetptp.mli lextptp.ml
	rm -f parsecoq.ml parsecoq.mli lexcoq.ml
	rm -f parsedk.ml parsedk.mli lexdk.ml
	rm -f checksum.ml
	rm -f zenon_modulo *.bin *.byt
	rm -rf dist zenon_modulo.tar.gz

.PHONY: depend
.depend depend: $(IMPL) $(INTF) $(COQSRC)
	$(CAMLDEP) $(IMPL) $(INTF) >.depend
	$(COQDEP) $(COQSRC) >>.depend

include .depend
