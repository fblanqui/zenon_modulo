%------------------------------------------------------------------------------
% File     : CSR070+1 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Common Sense Reasoning
% Problem  : Autogenerated Cyc Problem CSR070+1
% Version  : Especial.
% English  :

% Refs     : [RS+]   Reagan Smith et al., The Cyc TPTP Challenge Problem
% Source   : [RS+]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v6.1.0, 0.04 v6.0.0, 0.25 v5.5.0, 0.08 v5.4.0, 0.13 v5.3.0, 0.22 v5.2.0, 0.07 v5.0.0, 0.10 v4.1.0, 0.06 v4.0.1, 0.05 v3.7.0, 0.00 v3.4.0
% Syntax   : Number of formulae    :   80 (  21 unit)
%            Number of atoms       :  149 (   0 equality)
%            Maximal formula depth :    7 (   3 average)
%            Number of connectives :   70 (   1 ~  ;   0  |;  11  &)
%                                         (   0 <=>;  58 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   27 (   0 propositional; 1-3 arity)
%            Number of functors    :   26 (  25 constant; 0-3 arity)
%            Number of variables   :  124 (   0 singleton; 124 !;   0 ?)
%            Maximal term depth    :    2 (   1 average)
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
% Cyc Assertion #849068:
fof(just1,axiom,(
    transitivebinarypredicate(c_genlpreds) )).

% Cyc Assertion #1077444:
fof(just2,axiom,(
    genlmt(c_calendarsmt,c_calendarsvocabularymt) )).

% Cyc Assertion #1322220:
fof(just3,axiom,(
    transitivebinarypredicate(c_genlmt) )).

% Cyc Assertion #1650755:
fof(just4,axiom,(
    genlmt(c_basekb,c_universalvocabularymt) )).

% Cyc Assertion #1706514:
fof(just5,axiom,(
    genlmt(c_cyclistsmt,c_calendarsmt) )).

% Cyc Assertion #1746783:
fof(just6,axiom,(
    genlmt(c_calendarsvocabularymt,c_basekb) )).

% Cyc Assertion #2156160:
fof(just7,axiom,(
    genlpreds(c_tptptypes_6_818,c_tptptypes_5_802) )).

fof(just8,axiom,(
    ! [ARG1,ARG2] :
      ( tptptypes_6_818(ARG1,ARG2)
     => tptptypes_5_802(ARG1,ARG2) ) )).

% Cyc Assertion #2156167:
fof(just9,axiom,(
    genlpreds(c_tptptypes_7_819,c_tptptypes_6_818) )).

fof(just10,axiom,(
    ! [ARG1,ARG2] :
      ( tptptypes_7_819(ARG1,ARG2)
     => tptptypes_6_818(ARG1,ARG2) ) )).

% Cyc Assertion #2156195:
fof(just11,axiom,(
    genlpreds(c_tptptypes_8_823,c_tptptypes_7_819) )).

fof(just12,axiom,(
    ! [ARG1,ARG2] :
      ( tptptypes_8_823(ARG1,ARG2)
     => tptptypes_7_819(ARG1,ARG2) ) )).

% Cyc Assertion #2156202:
fof(just13,axiom,(
    genlpreds(c_tptptypes_9_824,c_tptptypes_8_823) )).

fof(just14,axiom,(
    ! [ARG1,ARG2] :
      ( tptptypes_9_824(ARG1,ARG2)
     => tptptypes_8_823(ARG1,ARG2) ) )).

% Cyc Assertion #2170932:
fof(just15,axiom,(
    genlmt(c_tptp_spindleheadmt,c_cyclistsmt) )).

% Cyc Assertion #2181608:
fof(just16,axiom,(
    genlmt(c_tptp_spindlecollectormt,c_tptp_member2668_mt) )).

% Cyc Assertion #2186907:
fof(just17,axiom,(
    genlmt(c_tptp_member3993_mt,c_tptp_spindleheadmt) )).

% Cyc Assertion #2186908:
fof(just18,axiom,(
    genlmt(c_tptp_spindlecollectormt,c_tptp_member3993_mt) )).

% Cyc Assertion #2190761:
fof(just19,axiom,
    ( mtvisible(c_tptp_member2668_mt)
   => tptptypes_9_824(f_subcollectionofwithrelationfromtypefn(c_orientationvector,c_orientation,c_partiallytangible),c_tptpcol_16_8886) )).

% Cyc Assertion #398814:
fof(just20,axiom,(
    ! [OBJ,COL1,COL2] :
      ~ ( isa(OBJ,COL1)
        & isa(OBJ,COL2)
        & disjointwith(COL1,COL2) ) )).

% Cyc Assertion #831913:
fof(just21,axiom,(
    ! [SPECPRED,PRED,GENLPRED] :
      ( ( genlinverse(SPECPRED,PRED)
        & genlinverse(PRED,GENLPRED) )
     => genlpreds(SPECPRED,GENLPRED) ) )).

% Cyc Constant #45259:
fof(just22,axiom,(
    ! [ARG1,INS] :
      ( genlinverse(ARG1,INS)
     => binarypredicate(INS) ) )).

fof(just23,axiom,(
    ! [INS,ARG2] :
      ( genlinverse(INS,ARG2)
     => binarypredicate(INS) ) )).

fof(just24,axiom,(
    ! [OLD,ARG2,NEW] :
      ( ( genlinverse(OLD,ARG2)
        & genlpreds(NEW,OLD) )
     => genlinverse(NEW,ARG2) ) )).

fof(just25,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( genlinverse(ARG1,OLD)
        & genlpreds(OLD,NEW) )
     => genlinverse(ARG1,NEW) ) )).

% Cyc Constant #78648:
fof(just26,axiom,(
    ! [ARG1,INS] :
      ( disjointwith(ARG1,INS)
     => collection(INS) ) )).

fof(just27,axiom,(
    ! [INS,ARG2] :
      ( disjointwith(INS,ARG2)
     => collection(INS) ) )).

fof(just28,axiom,(
    ! [X,Y] :
      ( disjointwith(X,Y)
     => disjointwith(Y,X) ) )).

fof(just29,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( disjointwith(ARG1,OLD)
        & genls(NEW,OLD) )
     => disjointwith(ARG1,NEW) ) )).

fof(just30,axiom,(
    ! [OLD,ARG2,NEW] :
      ( ( disjointwith(OLD,ARG2)
        & genls(NEW,OLD) )
     => disjointwith(NEW,ARG2) ) )).

% Cyc Constant #138483:
fof(just31,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_16_8886)
     => tptpcol_16_8886(X) ) )).

fof(just32,axiom,(
    ! [X] :
      ( tptpcol_16_8886(X)
     => isa(X,c_tptpcol_16_8886) ) )).

% Cyc Constant #36435:
fof(just33,axiom,(
    ! [X] :
      ( isa(X,c_partiallytangible)
     => partiallytangible(X) ) )).

fof(just34,axiom,(
    ! [X] :
      ( partiallytangible(X)
     => isa(X,c_partiallytangible) ) )).

% Cyc Constant #119679:
fof(just35,axiom,(
    ! [ARG1,INS] :
      ( orientation(ARG1,INS)
     => orientationvector(INS) ) )).

fof(just36,axiom,(
    ! [INS,ARG2] :
      ( orientation(INS,ARG2)
     => spatialthing_localized(INS) ) )).

% Cyc Constant #24557:
fof(just37,axiom,(
    ! [X] :
      ( isa(X,c_orientationvector)
     => orientationvector(X) ) )).

fof(just38,axiom,(
    ! [X] :
      ( orientationvector(X)
     => isa(X,c_orientationvector) ) )).

% Cyc Constant #42488:
fof(just39,axiom,(
    ! [ARG1,ARG2,ARG3] : natfunction(f_subcollectionofwithrelationfromtypefn(ARG1,ARG2,ARG3),c_subcollectionofwithrelationfromtypefn) )).

fof(just40,axiom,(
    ! [ARG1,ARG2,ARG3] : natargument(f_subcollectionofwithrelationfromtypefn(ARG1,ARG2,ARG3),n_1,ARG1) )).

fof(just41,axiom,(
    ! [ARG1,ARG2,ARG3] : natargument(f_subcollectionofwithrelationfromtypefn(ARG1,ARG2,ARG3),n_2,ARG2) )).

fof(just42,axiom,(
    ! [ARG1,ARG2,ARG3] : natargument(f_subcollectionofwithrelationfromtypefn(ARG1,ARG2,ARG3),n_3,ARG3) )).

fof(just43,axiom,(
    ! [ARG1,ARG2,ARG3] : collection(f_subcollectionofwithrelationfromtypefn(ARG1,ARG2,ARG3)) )).

% Cyc NART #18865:
fof(just44,axiom,(
    ! [X] :
      ( isa(X,f_subcollectionofwithrelationfromtypefn(c_orientationvector,c_orientation,c_partiallytangible))
     => subcollectionofwithrelationfromtypefnorientationvectororientationpartiallytangible(X) ) )).

fof(just45,axiom,(
    ! [X] :
      ( subcollectionofwithrelationfromtypefnorientationvectororientationpartiallytangible(X)
     => isa(X,f_subcollectionofwithrelationfromtypefn(c_orientationvector,c_orientation,c_partiallytangible)) ) )).

% Cyc Constant #261493:
fof(just46,axiom,(
    ! [ARG1,INS] :
      ( tptptypes_9_824(ARG1,INS)
     => firstordercollection(INS) ) )).

fof(just47,axiom,(
    ! [INS,ARG2] :
      ( tptptypes_9_824(INS,ARG2)
     => firstordercollection(INS) ) )).

% Cyc Constant #261492:
fof(just48,axiom,(
    ! [ARG1,INS] :
      ( tptptypes_8_823(ARG1,INS)
     => firstordercollection(INS) ) )).

fof(just49,axiom,(
    ! [INS,ARG2] :
      ( tptptypes_8_823(INS,ARG2)
     => firstordercollection(INS) ) )).

% Cyc Constant #261488:
fof(just50,axiom,(
    ! [ARG1,INS] :
      ( tptptypes_7_819(ARG1,INS)
     => firstordercollection(INS) ) )).

fof(just51,axiom,(
    ! [INS,ARG2] :
      ( tptptypes_7_819(INS,ARG2)
     => firstordercollection(INS) ) )).

% Cyc Constant #261471:
fof(just52,axiom,(
    ! [ARG1,INS] :
      ( tptptypes_5_802(ARG1,INS)
     => firstordercollection(INS) ) )).

fof(just53,axiom,(
    ! [INS,ARG2] :
      ( tptptypes_5_802(INS,ARG2)
     => firstordercollection(INS) ) )).

% Cyc Constant #261487:
fof(just54,axiom,(
    ! [ARG1,INS] :
      ( tptptypes_6_818(ARG1,INS)
     => firstordercollection(INS) ) )).

fof(just55,axiom,(
    ! [INS,ARG2] :
      ( tptptypes_6_818(INS,ARG2)
     => firstordercollection(INS) ) )).

% Cyc Constant #27757:
fof(just56,axiom,(
    mtvisible(c_basekb) )).

% Cyc Constant #19550:
fof(just57,axiom,(
    ! [SPECMT,GENLMT] :
      ( ( mtvisible(SPECMT)
        & genlmt(SPECMT,GENLMT) )
     => mtvisible(GENLMT) ) )).

fof(just58,axiom,(
    ! [ARG1,INS] :
      ( genlmt(ARG1,INS)
     => microtheory(INS) ) )).

fof(just59,axiom,(
    ! [ARG1,INS] :
      ( genlmt(ARG1,INS)
     => microtheory(INS) ) )).

fof(just60,axiom,(
    ! [INS,ARG2] :
      ( genlmt(INS,ARG2)
     => microtheory(INS) ) )).

fof(just61,axiom,(
    ! [INS,ARG2] :
      ( genlmt(INS,ARG2)
     => microtheory(INS) ) )).

fof(just62,axiom,(
    ! [X,Y,Z] :
      ( ( genlmt(X,Y)
        & genlmt(Y,Z) )
     => genlmt(X,Z) ) )).

fof(just63,axiom,(
    ! [X] :
      ( microtheory(X)
     => genlmt(X,X) ) )).

fof(just64,axiom,(
    ! [X] :
      ( microtheory(X)
     => genlmt(X,X) ) )).

% Cyc Constant #127156:
fof(just65,axiom,(
    ! [X] :
      ( isa(X,c_transitivebinarypredicate)
     => transitivebinarypredicate(X) ) )).

fof(just66,axiom,(
    ! [X] :
      ( transitivebinarypredicate(X)
     => isa(X,c_transitivebinarypredicate) ) )).

% Cyc Constant #40273:
fof(just67,axiom,(
    ! [ARG1,INS] :
      ( genlpreds(ARG1,INS)
     => predicate(INS) ) )).

fof(just68,axiom,(
    ! [ARG1,INS] :
      ( genlpreds(ARG1,INS)
     => predicate(INS) ) )).

fof(just69,axiom,(
    ! [INS,ARG2] :
      ( genlpreds(INS,ARG2)
     => predicate(INS) ) )).

fof(just70,axiom,(
    ! [INS,ARG2] :
      ( genlpreds(INS,ARG2)
     => predicate(INS) ) )).

fof(just71,axiom,(
    ! [X,Y,Z] :
      ( ( genlpreds(X,Y)
        & genlpreds(Y,Z) )
     => genlpreds(X,Z) ) )).

fof(just72,axiom,(
    ! [X] :
      ( predicate(X)
     => genlpreds(X,X) ) )).

fof(just73,axiom,(
    ! [X] :
      ( predicate(X)
     => genlpreds(X,X) ) )).

% Cyc Constant #72115:
fof(just74,axiom,(
    ! [ARG1,INS] :
      ( isa(ARG1,INS)
     => collection(INS) ) )).

fof(just75,axiom,(
    ! [ARG1,INS] :
      ( isa(ARG1,INS)
     => collection(INS) ) )).

fof(just76,axiom,(
    ! [INS,ARG2] :
      ( isa(INS,ARG2)
     => thing(INS) ) )).

fof(just77,axiom,(
    ! [INS,ARG2] :
      ( isa(INS,ARG2)
     => thing(INS) ) )).

fof(just78,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( isa(ARG1,OLD)
        & genls(OLD,NEW) )
     => isa(ARG1,NEW) ) )).

% Cyc Constant #95028:
fof(just79,axiom,(
    mtvisible(c_universalvocabularymt) )).

fof(query70,conjecture,
    ( mtvisible(c_tptp_spindlecollectormt)
   => tptptypes_5_802(f_subcollectionofwithrelationfromtypefn(c_orientationvector,c_orientation,c_partiallytangible),c_tptpcol_16_8886) )).

%------------------------------------------------------------------------------