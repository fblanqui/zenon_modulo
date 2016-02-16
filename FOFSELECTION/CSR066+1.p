%------------------------------------------------------------------------------
% File     : CSR066+1 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Common Sense Reasoning
% Problem  : Autogenerated Cyc Problem CSR066+1
% Version  : Especial.
% English  :

% Refs     : [RS+]   Reagan Smith et al., The Cyc TPTP Challenge Problem
% Source   : [RS+]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.12 v5.4.0, 0.17 v5.3.0, 0.22 v5.2.0, 0.14 v5.0.0, 0.15 v4.1.0, 0.11 v4.0.0, 0.10 v3.7.0, 0.00 v3.4.0
% Syntax   : Number of formulae    :   74 (  27 unit)
%            Number of atoms       :  133 (   0 equality)
%            Maximal formula depth :    7 (   4 average)
%            Number of connectives :   60 (   1 ~  ;   0  |;  13  &)
%                                         (   0 <=>;  46 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   26 (   0 propositional; 1-3 arity)
%            Number of functors    :   25 (  21 constant; 0-4 arity)
%            Number of variables   :  134 (   0 singleton; 133 !;   1 ?)
%            Maximal term depth    :    4 (   1 average)
% SPC      : FOF_THM_RFO_NEQ

% Comments : Autogenerated from the OpenCyc KB. Documentation can be found at
%            http://opencyc.org/doc/#TPTP_Challenge_Problem_Set
%          : Cyc(R) Knowledge Base Copyright(C) 1995-2007 Cycorp, Inc., Austin,
%            TX, USA. All rights reserved.
%          : OpenCyc Knowledge Base Copyright(C) 2001-2007 Cycorp, Inc.,
%            Austin, TX, USA. All rights reserved.
%------------------------------------------------------------------------------
%$problem_series(cyc_scaling_1,[CSR025+1,CSR026+1,CSR027+1,CSR028+1,CSR029+1,CSR030+1,CSR031+1,CSR032+1,CSR033+1,CSR034+1,CSR035+1,CSR036+1,CSR037+1,CSR038+1,CSR039+1,CSR040+1,CSR041+1,CSR042+1,CSR043+1,CSR044+1,CSR045+1,CSR046+1,CSR047+1,CSR048+1,CSR049+1,CSR050+1,CSR051+1,CSR052+1,CSR053+1,CSR054+1,CSR055+1,CSR056+1,CSR057+1,CSR058+1,CSR059+1,CSR060+1,CSR061+1,CSR062+1,CSR063+1,CSR064+1,CSR065+1,CSR066+1,CSR067+1,CSR068+1,CSR069+1,CSR070+1,CSR071+1,CSR072+1,CSR073+1,CSR074+1])
%$static(cyc_scaling_1,include('Axioms/CSR002+0.ax'))
%----Empty file include('Axioms/CSR002+0.ax').
%------------------------------------------------------------------------------
% Cyc Assertion #592971:
fof(just1,axiom,(
    genlmt(c_cycorpproductsmt,c_basekb) )).

% Cyc Assertion #600900:
fof(just2,axiom,(
    genlmt(c_cycnounlearnermt,c_cycorpproductsmt) )).

% Cyc Assertion #767368:
fof(just3,axiom,(
    genlmt(f_contentmtofcdafromeventfn(f_urlreferentfn(f_urlfn(s_http_webnjiteducjohnsontreebiochhtm)),c_translation_21),c_machinelearningspindleheadmt) )).

% Cyc Assertion #976441:
fof(just4,axiom,(
    ! [TERM,INDEPCOL,PRED,DEPCOL] :
      ( ( isa(TERM,INDEPCOL)
        & relationexistsall(PRED,DEPCOL,INDEPCOL) )
     => isa(f_relationexistsallfn(TERM,PRED,DEPCOL,INDEPCOL),DEPCOL) ) )).

fof(just5,axiom,(
    resultisaarg(c_relationexistsallfn,n_3) )).

% Cyc Assertion #1322220:
fof(just6,axiom,(
    transitivebinarypredicate(c_genlmt) )).

% Cyc Assertion #1614635:
fof(just7,axiom,(
    genlmt(c_machinelearningspindleheadmt,c_cycnounlearnermt) )).

% Cyc Assertion #1650755:
fof(just8,axiom,(
    genlmt(c_basekb,c_universalvocabularymt) )).

% Cyc Assertion #2198037:
fof(just9,axiom,(
    ! [TERM] :
      ( shavingrazor_manual(TERM)
     => tptp_8_271(f_relationexistsallfn(TERM,c_tptp_8_271,c_tptpcol_16_25972,c_shavingrazor_manual),TERM) ) )).

fof(just10,axiom,(
    relationexistsall(c_tptp_8_271,c_tptpcol_16_25972,c_shavingrazor_manual) )).

% Cyc Assertion #2207952:
fof(just11,axiom,(
    shavingrazor_manual(c_theprototypicalshavingrazor_manual) )).

% Cyc Assertion #398814:
fof(just12,axiom,(
    ! [OBJ,COL1,COL2] :
      ~ ( isa(OBJ,COL1)
        & isa(OBJ,COL2)
        & disjointwith(COL1,COL2) ) )).

% Cyc Assertion #831913:
fof(just13,axiom,(
    ! [SPECPRED,PRED,GENLPRED] :
      ( ( genlinverse(SPECPRED,PRED)
        & genlinverse(PRED,GENLPRED) )
     => genlpreds(SPECPRED,GENLPRED) ) )).

% Cyc Constant #40273:
fof(just14,axiom,(
    ! [ARG1,INS] :
      ( genlpreds(ARG1,INS)
     => predicate(INS) ) )).

fof(just15,axiom,(
    ! [ARG1,INS] :
      ( genlpreds(ARG1,INS)
     => predicate(INS) ) )).

fof(just16,axiom,(
    ! [INS,ARG2] :
      ( genlpreds(INS,ARG2)
     => predicate(INS) ) )).

fof(just17,axiom,(
    ! [INS,ARG2] :
      ( genlpreds(INS,ARG2)
     => predicate(INS) ) )).

fof(just18,axiom,(
    ! [X,Y,Z] :
      ( ( genlpreds(X,Y)
        & genlpreds(Y,Z) )
     => genlpreds(X,Z) ) )).

fof(just19,axiom,(
    ! [X] :
      ( predicate(X)
     => genlpreds(X,X) ) )).

fof(just20,axiom,(
    ! [X] :
      ( predicate(X)
     => genlpreds(X,X) ) )).

% Cyc Constant #45259:
fof(just21,axiom,(
    ! [ARG1,INS] :
      ( genlinverse(ARG1,INS)
     => binarypredicate(INS) ) )).

fof(just22,axiom,(
    ! [INS,ARG2] :
      ( genlinverse(INS,ARG2)
     => binarypredicate(INS) ) )).

fof(just23,axiom,(
    ! [OLD,ARG2,NEW] :
      ( ( genlinverse(OLD,ARG2)
        & genlpreds(NEW,OLD) )
     => genlinverse(NEW,ARG2) ) )).

fof(just24,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( genlinverse(ARG1,OLD)
        & genlpreds(OLD,NEW) )
     => genlinverse(ARG1,NEW) ) )).

% Cyc Constant #78648:
fof(just25,axiom,(
    ! [ARG1,INS] :
      ( disjointwith(ARG1,INS)
     => collection(INS) ) )).

fof(just26,axiom,(
    ! [INS,ARG2] :
      ( disjointwith(INS,ARG2)
     => collection(INS) ) )).

fof(just27,axiom,(
    ! [X,Y] :
      ( disjointwith(X,Y)
     => disjointwith(Y,X) ) )).

fof(just28,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( disjointwith(ARG1,OLD)
        & genls(NEW,OLD) )
     => disjointwith(ARG1,NEW) ) )).

fof(just29,axiom,(
    ! [OLD,ARG2,NEW] :
      ( ( disjointwith(OLD,ARG2)
        & genls(NEW,OLD) )
     => disjointwith(NEW,ARG2) ) )).

% Cyc Constant #104695:
fof(just30,axiom,(
    ! [X] :
      ( isa(X,c_shavingrazor_manual)
     => shavingrazor_manual(X) ) )).

fof(just31,axiom,(
    ! [X] :
      ( shavingrazor_manual(X)
     => isa(X,c_shavingrazor_manual) ) )).

% Cyc Constant #155569:
fof(just32,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_16_25972)
     => tptpcol_16_25972(X) ) )).

fof(just33,axiom,(
    ! [X] :
      ( tptpcol_16_25972(X)
     => isa(X,c_tptpcol_16_25972) ) )).

% Cyc Constant #262618:
fof(just34,axiom,(
    ! [ARG1,INS] :
      ( tptp_8_271(ARG1,INS)
     => razor(INS) ) )).

fof(just35,axiom,(
    ! [INS,ARG2] :
      ( tptp_8_271(INS,ARG2)
     => tptpcol_5_24579(INS) ) )).

% Cyc Constant #77435:
fof(just36,axiom,(
    ! [ARG1,ARG2,INS] :
      ( relationexistsall(ARG1,ARG2,INS)
     => collection(INS) ) )).

fof(just37,axiom,(
    ! [ARG1,INS,ARG3] :
      ( relationexistsall(ARG1,INS,ARG3)
     => collection(INS) ) )).

fof(just38,axiom,(
    ! [INS,ARG2,ARG3] :
      ( relationexistsall(INS,ARG2,ARG3)
     => binarypredicate(INS) ) )).

% Cyc Constant #127156:
fof(just39,axiom,(
    ! [X] :
      ( isa(X,c_transitivebinarypredicate)
     => transitivebinarypredicate(X) ) )).

fof(just40,axiom,(
    ! [X] :
      ( transitivebinarypredicate(X)
     => isa(X,c_transitivebinarypredicate) ) )).

% Cyc Constant #72115:
fof(just41,axiom,(
    ! [ARG1,INS] :
      ( isa(ARG1,INS)
     => collection(INS) ) )).

fof(just42,axiom,(
    ! [ARG1,INS] :
      ( isa(ARG1,INS)
     => collection(INS) ) )).

fof(just43,axiom,(
    ! [INS,ARG2] :
      ( isa(INS,ARG2)
     => thing(INS) ) )).

fof(just44,axiom,(
    ! [INS,ARG2] :
      ( isa(INS,ARG2)
     => thing(INS) ) )).

fof(just45,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( isa(ARG1,OLD)
        & genls(OLD,NEW) )
     => isa(ARG1,NEW) ) )).

% Cyc Constant #109289:
fof(just46,axiom,(
    ! [ARG1,ARG2,ARG3,ARG4] : natfunction(f_relationexistsallfn(ARG1,ARG2,ARG3,ARG4),c_relationexistsallfn) )).

fof(just47,axiom,(
    ! [ARG1,ARG2,ARG3,ARG4] : natargument(f_relationexistsallfn(ARG1,ARG2,ARG3,ARG4),n_1,ARG1) )).

fof(just48,axiom,(
    ! [ARG1,ARG2,ARG3,ARG4] : natargument(f_relationexistsallfn(ARG1,ARG2,ARG3,ARG4),n_2,ARG2) )).

fof(just49,axiom,(
    ! [ARG1,ARG2,ARG3,ARG4] : natargument(f_relationexistsallfn(ARG1,ARG2,ARG3,ARG4),n_3,ARG3) )).

fof(just50,axiom,(
    ! [ARG1,ARG2,ARG3,ARG4] : natargument(f_relationexistsallfn(ARG1,ARG2,ARG3,ARG4),n_4,ARG4) )).

fof(just51,axiom,(
    ! [ARG1,ARG2,ARG3,ARG4] : thing(f_relationexistsallfn(ARG1,ARG2,ARG3,ARG4)) )).

% Cyc Constant #97397:
fof(just52,axiom,(
    ! [ARG1,INS] :
      ( resultisaarg(ARG1,INS)
     => positiveinteger(INS) ) )).

fof(just53,axiom,(
    ! [INS,ARG2] :
      ( resultisaarg(INS,ARG2)
     => function_denotational(INS) ) )).

% Cyc Constant #129091:
fof(just54,axiom,(
    ! [ARG1] : natfunction(f_urlfn(ARG1),c_urlfn) )).

fof(just55,axiom,(
    ! [ARG1] : natargument(f_urlfn(ARG1),n_1,ARG1) )).

fof(just56,axiom,(
    ! [ARG1] : uniformresourcelocator(f_urlfn(ARG1)) )).

% Cyc Constant #78971:
fof(just57,axiom,(
    ! [ARG1] : natfunction(f_urlreferentfn(ARG1),c_urlreferentfn) )).

fof(just58,axiom,(
    ! [ARG1] : natargument(f_urlreferentfn(ARG1),n_1,ARG1) )).

fof(just59,axiom,(
    ! [ARG1] : computerdataartifact(f_urlreferentfn(ARG1)) )).

% Cyc Constant #71728:
fof(just60,axiom,(
    ! [ARG1,ARG2] : natfunction(f_contentmtofcdafromeventfn(ARG1,ARG2),c_contentmtofcdafromeventfn) )).

fof(just61,axiom,(
    ! [ARG1,ARG2] : natargument(f_contentmtofcdafromeventfn(ARG1,ARG2),n_1,ARG1) )).

fof(just62,axiom,(
    ! [ARG1,ARG2] : natargument(f_contentmtofcdafromeventfn(ARG1,ARG2),n_2,ARG2) )).

fof(just63,axiom,(
    ! [ARG1,ARG2] : microtheory(f_contentmtofcdafromeventfn(ARG1,ARG2)) )).

% Cyc Constant #95028:
fof(just64,axiom,(
    mtvisible(c_universalvocabularymt) )).

% Cyc Constant #19550:
fof(just65,axiom,(
    ! [SPECMT,GENLMT] :
      ( ( mtvisible(SPECMT)
        & genlmt(SPECMT,GENLMT) )
     => mtvisible(GENLMT) ) )).

fof(just66,axiom,(
    ! [ARG1,INS] :
      ( genlmt(ARG1,INS)
     => microtheory(INS) ) )).

fof(just67,axiom,(
    ! [ARG1,INS] :
      ( genlmt(ARG1,INS)
     => microtheory(INS) ) )).

fof(just68,axiom,(
    ! [INS,ARG2] :
      ( genlmt(INS,ARG2)
     => microtheory(INS) ) )).

fof(just69,axiom,(
    ! [INS,ARG2] :
      ( genlmt(INS,ARG2)
     => microtheory(INS) ) )).

fof(just70,axiom,(
    ! [X,Y,Z] :
      ( ( genlmt(X,Y)
        & genlmt(Y,Z) )
     => genlmt(X,Z) ) )).

fof(just71,axiom,(
    ! [X] :
      ( microtheory(X)
     => genlmt(X,X) ) )).

fof(just72,axiom,(
    ! [X] :
      ( microtheory(X)
     => genlmt(X,X) ) )).

% Cyc Constant #27757:
fof(just73,axiom,(
    mtvisible(c_basekb) )).

fof(query66,conjecture,(
    ? [X] :
      ( mtvisible(f_contentmtofcdafromeventfn(f_urlreferentfn(f_urlfn(s_http_webnjiteducjohnsontreebiochhtm)),c_translation_21))
     => ( tptp_8_271(X,c_theprototypicalshavingrazor_manual)
        & tptpcol_16_25972(X) ) ) )).

%------------------------------------------------------------------------------