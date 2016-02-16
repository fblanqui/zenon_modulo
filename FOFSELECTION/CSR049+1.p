%------------------------------------------------------------------------------
% File     : CSR049+1 : TPTP v6.1.0. Released v3.4.0.
% Domain   : Common Sense Reasoning
% Problem  : Autogenerated Cyc Problem CSR049+1
% Version  : Especial.
% English  :

% Refs     : [RS+]   Reagan Smith et al., The Cyc TPTP Challenge Problem
% Source   : [RS+]
% Names    :

% Status   : Theorem
% Rating   : 0.00 v5.5.0, 0.11 v5.3.0, 0.09 v5.2.0, 0.00 v4.1.0, 0.11 v4.0.0, 0.10 v3.7.0, 0.00 v3.4.0
% Syntax   : Number of formulae    :  177 (  39 unit)
%            Number of atoms       :  328 (   0 equality)
%            Maximal formula depth :    7 (   3 average)
%            Number of connectives :  153 (   2 ~  ;   0  |;  15  &)
%                                         (   0 <=>; 136 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   45 (   0 propositional; 1-2 arity)
%            Number of functors    :   40 (  40 constant; 0-0 arity)
%            Number of variables   :  183 (   0 singleton; 183 !;   0 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_EPR

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
% Cyc Assertion #752062:
fof(just1,axiom,(
    genlmt(c_gregoriancalendarmt,c_basekb) )).

% Cyc Assertion #935028:
fof(just2,axiom,(
    genlmt(c_unitedstatesgeographypeoplemt,c_peopledatamt) )).

% Cyc Assertion #1315163:
fof(just3,axiom,(
    genlmt(c_unitedstatessociallifemt,c_gregoriancalendarmt) )).

% Cyc Assertion #1322220:
fof(just4,axiom,(
    transitivebinarypredicate(c_genlmt) )).

% Cyc Assertion #1650755:
fof(just5,axiom,(
    genlmt(c_basekb,c_universalvocabularymt) )).

% Cyc Assertion #1785295:
fof(just6,axiom,(
    genlmt(c_peopledatamt,c_unitedstatessociallifemt) )).

% Cyc Assertion #1822756:
fof(just7,axiom,(
    genls(c_tptpcol_2_2,c_tptpcol_1_1) )).

fof(just8,axiom,(
    ! [OBJ] :
      ( tptpcol_2_2(OBJ)
     => tptpcol_1_1(OBJ) ) )).

% Cyc Assertion #1863715:
fof(just9,axiom,(
    genls(c_tptpcol_3_16386,c_tptpcol_2_2) )).

fof(just10,axiom,(
    ! [OBJ] :
      ( tptpcol_3_16386(OBJ)
     => tptpcol_2_2(OBJ) ) )).

% Cyc Assertion #1884194:
fof(just11,axiom,(
    genls(c_tptpcol_4_24578,c_tptpcol_3_16386) )).

fof(just12,axiom,(
    ! [OBJ] :
      ( tptpcol_4_24578(OBJ)
     => tptpcol_3_16386(OBJ) ) )).

% Cyc Assertion #1884196:
fof(just13,axiom,(
    genls(c_tptpcol_5_24579,c_tptpcol_4_24578) )).

fof(just14,axiom,(
    ! [OBJ] :
      ( tptpcol_5_24579(OBJ)
     => tptpcol_4_24578(OBJ) ) )).

% Cyc Assertion #1889315:
fof(just15,axiom,(
    genls(c_tptpcol_6_26627,c_tptpcol_5_24579) )).

fof(just16,axiom,(
    ! [OBJ] :
      ( tptpcol_6_26627(OBJ)
     => tptpcol_5_24579(OBJ) ) )).

% Cyc Assertion #1889317:
fof(just17,axiom,(
    genls(c_tptpcol_7_26628,c_tptpcol_6_26627) )).

fof(just18,axiom,(
    ! [OBJ] :
      ( tptpcol_7_26628(OBJ)
     => tptpcol_6_26627(OBJ) ) )).

% Cyc Assertion #1889319:
fof(just19,axiom,(
    genls(c_tptpcol_8_26629,c_tptpcol_7_26628) )).

fof(just20,axiom,(
    ! [OBJ] :
      ( tptpcol_8_26629(OBJ)
     => tptpcol_7_26628(OBJ) ) )).

% Cyc Assertion #1889958:
fof(just21,axiom,(
    genls(c_tptpcol_9_26885,c_tptpcol_8_26629) )).

fof(just22,axiom,(
    ! [OBJ] :
      ( tptpcol_9_26885(OBJ)
     => tptpcol_8_26629(OBJ) ) )).

% Cyc Assertion #1889960:
fof(just23,axiom,(
    genls(c_tptpcol_10_26886,c_tptpcol_9_26885) )).

fof(just24,axiom,(
    ! [OBJ] :
      ( tptpcol_10_26886(OBJ)
     => tptpcol_9_26885(OBJ) ) )).

% Cyc Assertion #1889962:
fof(just25,axiom,(
    genls(c_tptpcol_11_26887,c_tptpcol_10_26886) )).

fof(just26,axiom,(
    ! [OBJ] :
      ( tptpcol_11_26887(OBJ)
     => tptpcol_10_26886(OBJ) ) )).

% Cyc Assertion #1890041:
fof(just27,axiom,(
    genls(c_tptpcol_12_26919,c_tptpcol_11_26887) )).

fof(just28,axiom,(
    ! [OBJ] :
      ( tptpcol_12_26919(OBJ)
     => tptpcol_11_26887(OBJ) ) )).

% Cyc Assertion #1890043:
fof(just29,axiom,(
    genls(c_tptpcol_13_26920,c_tptpcol_12_26919) )).

fof(just30,axiom,(
    ! [OBJ] :
      ( tptpcol_13_26920(OBJ)
     => tptpcol_12_26919(OBJ) ) )).

% Cyc Assertion #1890045:
fof(just31,axiom,(
    genls(c_tptpcol_14_26921,c_tptpcol_13_26920) )).

fof(just32,axiom,(
    ! [OBJ] :
      ( tptpcol_14_26921(OBJ)
     => tptpcol_13_26920(OBJ) ) )).

% Cyc Assertion #1890054:
fof(just33,axiom,(
    genls(c_tptpcol_15_26925,c_tptpcol_14_26921) )).

fof(just34,axiom,(
    ! [OBJ] :
      ( tptpcol_15_26925(OBJ)
     => tptpcol_14_26921(OBJ) ) )).

% Cyc Assertion #1890056:
fof(just35,axiom,(
    genls(c_tptpcol_16_26926,c_tptpcol_15_26925) )).

fof(just36,axiom,(
    ! [OBJ] :
      ( tptpcol_16_26926(OBJ)
     => tptpcol_15_26925(OBJ) ) )).

% Cyc Assertion #1986593:
fof(just37,axiom,(
    genls(c_tptpcol_2_65537,c_tptpcol_1_65536) )).

fof(just38,axiom,(
    ! [OBJ] :
      ( tptpcol_2_65537(OBJ)
     => tptpcol_1_65536(OBJ) ) )).

% Cyc Assertion #2027552:
fof(just39,axiom,(
    genls(c_tptpcol_3_81921,c_tptpcol_2_65537) )).

fof(just40,axiom,(
    ! [OBJ] :
      ( tptpcol_3_81921(OBJ)
     => tptpcol_2_65537(OBJ) ) )).

% Cyc Assertion #2048031:
fof(just41,axiom,(
    genls(c_tptpcol_4_90113,c_tptpcol_3_81921) )).

fof(just42,axiom,(
    ! [OBJ] :
      ( tptpcol_4_90113(OBJ)
     => tptpcol_3_81921(OBJ) ) )).

% Cyc Assertion #2048033:
fof(just43,axiom,(
    genls(c_tptpcol_5_90114,c_tptpcol_4_90113) )).

fof(just44,axiom,(
    ! [OBJ] :
      ( tptpcol_5_90114(OBJ)
     => tptpcol_4_90113(OBJ) ) )).

% Cyc Assertion #2053152:
fof(just45,axiom,(
    genls(c_tptpcol_6_92162,c_tptpcol_5_90114) )).

fof(just46,axiom,(
    ! [OBJ] :
      ( tptpcol_6_92162(OBJ)
     => tptpcol_5_90114(OBJ) ) )).

% Cyc Assertion #2053154:
fof(just47,axiom,(
    genls(c_tptpcol_7_92163,c_tptpcol_6_92162) )).

fof(just48,axiom,(
    ! [OBJ] :
      ( tptpcol_7_92163(OBJ)
     => tptpcol_6_92162(OBJ) ) )).

% Cyc Assertion #2053156:
fof(just49,axiom,(
    genls(c_tptpcol_8_92164,c_tptpcol_7_92163) )).

fof(just50,axiom,(
    ! [OBJ] :
      ( tptpcol_8_92164(OBJ)
     => tptpcol_7_92163(OBJ) ) )).

% Cyc Assertion #2053158:
fof(just51,axiom,(
    genls(c_tptpcol_9_92165,c_tptpcol_8_92164) )).

fof(just52,axiom,(
    ! [OBJ] :
      ( tptpcol_9_92165(OBJ)
     => tptpcol_8_92164(OBJ) ) )).

% Cyc Assertion #2053160:
fof(just53,axiom,(
    genls(c_tptpcol_10_92166,c_tptpcol_9_92165) )).

fof(just54,axiom,(
    ! [OBJ] :
      ( tptpcol_10_92166(OBJ)
     => tptpcol_9_92165(OBJ) ) )).

% Cyc Assertion #2053319:
fof(just55,axiom,(
    genls(c_tptpcol_11_92230,c_tptpcol_10_92166) )).

fof(just56,axiom,(
    ! [OBJ] :
      ( tptpcol_11_92230(OBJ)
     => tptpcol_10_92166(OBJ) ) )).

% Cyc Assertion #2053398:
fof(just57,axiom,(
    genls(c_tptpcol_12_92262,c_tptpcol_11_92230) )).

fof(just58,axiom,(
    ! [OBJ] :
      ( tptpcol_12_92262(OBJ)
     => tptpcol_11_92230(OBJ) ) )).

% Cyc Assertion #2053400:
fof(just59,axiom,(
    genls(c_tptpcol_13_92263,c_tptpcol_12_92262) )).

fof(just60,axiom,(
    ! [OBJ] :
      ( tptpcol_13_92263(OBJ)
     => tptpcol_12_92262(OBJ) ) )).

% Cyc Assertion #2053402:
fof(just61,axiom,(
    genls(c_tptpcol_14_92264,c_tptpcol_13_92263) )).

fof(just62,axiom,(
    ! [OBJ] :
      ( tptpcol_14_92264(OBJ)
     => tptpcol_13_92263(OBJ) ) )).

% Cyc Assertion #2053411:
fof(just63,axiom,(
    genls(c_tptpcol_15_92268,c_tptpcol_14_92264) )).

fof(just64,axiom,(
    ! [OBJ] :
      ( tptpcol_15_92268(OBJ)
     => tptpcol_14_92264(OBJ) ) )).

% Cyc Assertion #2053413:
fof(just65,axiom,(
    genls(c_tptpcol_16_92269,c_tptpcol_15_92268) )).

fof(just66,axiom,(
    ! [OBJ] :
      ( tptpcol_16_92269(OBJ)
     => tptpcol_15_92268(OBJ) ) )).

% Cyc Assertion #2150427:
fof(just67,axiom,(
    disjointwith(c_tptpcol_1_1,c_tptpcol_1_65536) )).

fof(just68,axiom,(
    ! [OBJ] :
      ~ ( tptpcol_1_1(OBJ)
        & tptpcol_1_65536(OBJ) ) )).

% Cyc Assertion #398814:
fof(just69,axiom,(
    ! [OBJ,COL1,COL2] :
      ~ ( isa(OBJ,COL1)
        & isa(OBJ,COL2)
        & disjointwith(COL1,COL2) ) )).

% Cyc Assertion #831913:
fof(just70,axiom,(
    ! [SPECPRED,PRED,GENLPRED] :
      ( ( genlinverse(SPECPRED,PRED)
        & genlinverse(PRED,GENLPRED) )
     => genlpreds(SPECPRED,GENLPRED) ) )).

% Cyc Constant #40273:
fof(just71,axiom,(
    ! [ARG1,INS] :
      ( genlpreds(ARG1,INS)
     => predicate(INS) ) )).

fof(just72,axiom,(
    ! [ARG1,INS] :
      ( genlpreds(ARG1,INS)
     => predicate(INS) ) )).

fof(just73,axiom,(
    ! [INS,ARG2] :
      ( genlpreds(INS,ARG2)
     => predicate(INS) ) )).

fof(just74,axiom,(
    ! [INS,ARG2] :
      ( genlpreds(INS,ARG2)
     => predicate(INS) ) )).

fof(just75,axiom,(
    ! [X,Y,Z] :
      ( ( genlpreds(X,Y)
        & genlpreds(Y,Z) )
     => genlpreds(X,Z) ) )).

fof(just76,axiom,(
    ! [X] :
      ( predicate(X)
     => genlpreds(X,X) ) )).

fof(just77,axiom,(
    ! [X] :
      ( predicate(X)
     => genlpreds(X,X) ) )).

% Cyc Constant #45259:
fof(just78,axiom,(
    ! [ARG1,INS] :
      ( genlinverse(ARG1,INS)
     => binarypredicate(INS) ) )).

fof(just79,axiom,(
    ! [INS,ARG2] :
      ( genlinverse(INS,ARG2)
     => binarypredicate(INS) ) )).

fof(just80,axiom,(
    ! [OLD,ARG2,NEW] :
      ( ( genlinverse(OLD,ARG2)
        & genlpreds(NEW,OLD) )
     => genlinverse(NEW,ARG2) ) )).

fof(just81,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( genlinverse(ARG1,OLD)
        & genlpreds(OLD,NEW) )
     => genlinverse(ARG1,NEW) ) )).

% Cyc Constant #78648:
fof(just82,axiom,(
    ! [ARG1,INS] :
      ( disjointwith(ARG1,INS)
     => collection(INS) ) )).

fof(just83,axiom,(
    ! [INS,ARG2] :
      ( disjointwith(INS,ARG2)
     => collection(INS) ) )).

fof(just84,axiom,(
    ! [X,Y] :
      ( disjointwith(X,Y)
     => disjointwith(Y,X) ) )).

fof(just85,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( disjointwith(ARG1,OLD)
        & genls(NEW,OLD) )
     => disjointwith(ARG1,NEW) ) )).

fof(just86,axiom,(
    ! [OLD,ARG2,NEW] :
      ( ( disjointwith(OLD,ARG2)
        & genls(NEW,OLD) )
     => disjointwith(NEW,ARG2) ) )).

% Cyc Constant #221866:
fof(just87,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_16_92269)
     => tptpcol_16_92269(X) ) )).

fof(just88,axiom,(
    ! [X] :
      ( tptpcol_16_92269(X)
     => isa(X,c_tptpcol_16_92269) ) )).

% Cyc Constant #221865:
fof(just89,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_15_92268)
     => tptpcol_15_92268(X) ) )).

fof(just90,axiom,(
    ! [X] :
      ( tptpcol_15_92268(X)
     => isa(X,c_tptpcol_15_92268) ) )).

% Cyc Constant #221861:
fof(just91,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_14_92264)
     => tptpcol_14_92264(X) ) )).

fof(just92,axiom,(
    ! [X] :
      ( tptpcol_14_92264(X)
     => isa(X,c_tptpcol_14_92264) ) )).

% Cyc Constant #221860:
fof(just93,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_13_92263)
     => tptpcol_13_92263(X) ) )).

fof(just94,axiom,(
    ! [X] :
      ( tptpcol_13_92263(X)
     => isa(X,c_tptpcol_13_92263) ) )).

% Cyc Constant #221859:
fof(just95,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_12_92262)
     => tptpcol_12_92262(X) ) )).

fof(just96,axiom,(
    ! [X] :
      ( tptpcol_12_92262(X)
     => isa(X,c_tptpcol_12_92262) ) )).

% Cyc Constant #221827:
fof(just97,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_11_92230)
     => tptpcol_11_92230(X) ) )).

fof(just98,axiom,(
    ! [X] :
      ( tptpcol_11_92230(X)
     => isa(X,c_tptpcol_11_92230) ) )).

% Cyc Constant #221763:
fof(just99,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_10_92166)
     => tptpcol_10_92166(X) ) )).

fof(just100,axiom,(
    ! [X] :
      ( tptpcol_10_92166(X)
     => isa(X,c_tptpcol_10_92166) ) )).

% Cyc Constant #221762:
fof(just101,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_9_92165)
     => tptpcol_9_92165(X) ) )).

fof(just102,axiom,(
    ! [X] :
      ( tptpcol_9_92165(X)
     => isa(X,c_tptpcol_9_92165) ) )).

% Cyc Constant #221761:
fof(just103,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_8_92164)
     => tptpcol_8_92164(X) ) )).

fof(just104,axiom,(
    ! [X] :
      ( tptpcol_8_92164(X)
     => isa(X,c_tptpcol_8_92164) ) )).

% Cyc Constant #221760:
fof(just105,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_7_92163)
     => tptpcol_7_92163(X) ) )).

fof(just106,axiom,(
    ! [X] :
      ( tptpcol_7_92163(X)
     => isa(X,c_tptpcol_7_92163) ) )).

% Cyc Constant #221759:
fof(just107,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_6_92162)
     => tptpcol_6_92162(X) ) )).

fof(just108,axiom,(
    ! [X] :
      ( tptpcol_6_92162(X)
     => isa(X,c_tptpcol_6_92162) ) )).

% Cyc Constant #219711:
fof(just109,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_5_90114)
     => tptpcol_5_90114(X) ) )).

fof(just110,axiom,(
    ! [X] :
      ( tptpcol_5_90114(X)
     => isa(X,c_tptpcol_5_90114) ) )).

% Cyc Constant #219710:
fof(just111,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_4_90113)
     => tptpcol_4_90113(X) ) )).

fof(just112,axiom,(
    ! [X] :
      ( tptpcol_4_90113(X)
     => isa(X,c_tptpcol_4_90113) ) )).

% Cyc Constant #211518:
fof(just113,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_3_81921)
     => tptpcol_3_81921(X) ) )).

fof(just114,axiom,(
    ! [X] :
      ( tptpcol_3_81921(X)
     => isa(X,c_tptpcol_3_81921) ) )).

% Cyc Constant #195133:
fof(just115,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_1_65536)
     => tptpcol_1_65536(X) ) )).

fof(just116,axiom,(
    ! [X] :
      ( tptpcol_1_65536(X)
     => isa(X,c_tptpcol_1_65536) ) )).

% Cyc Constant #195134:
fof(just117,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_2_65537)
     => tptpcol_2_65537(X) ) )).

fof(just118,axiom,(
    ! [X] :
      ( tptpcol_2_65537(X)
     => isa(X,c_tptpcol_2_65537) ) )).

% Cyc Constant #156523:
fof(just119,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_16_26926)
     => tptpcol_16_26926(X) ) )).

fof(just120,axiom,(
    ! [X] :
      ( tptpcol_16_26926(X)
     => isa(X,c_tptpcol_16_26926) ) )).

% Cyc Constant #156522:
fof(just121,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_15_26925)
     => tptpcol_15_26925(X) ) )).

fof(just122,axiom,(
    ! [X] :
      ( tptpcol_15_26925(X)
     => isa(X,c_tptpcol_15_26925) ) )).

% Cyc Constant #156518:
fof(just123,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_14_26921)
     => tptpcol_14_26921(X) ) )).

fof(just124,axiom,(
    ! [X] :
      ( tptpcol_14_26921(X)
     => isa(X,c_tptpcol_14_26921) ) )).

% Cyc Constant #156517:
fof(just125,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_13_26920)
     => tptpcol_13_26920(X) ) )).

fof(just126,axiom,(
    ! [X] :
      ( tptpcol_13_26920(X)
     => isa(X,c_tptpcol_13_26920) ) )).

% Cyc Constant #156516:
fof(just127,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_12_26919)
     => tptpcol_12_26919(X) ) )).

fof(just128,axiom,(
    ! [X] :
      ( tptpcol_12_26919(X)
     => isa(X,c_tptpcol_12_26919) ) )).

% Cyc Constant #156484:
fof(just129,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_11_26887)
     => tptpcol_11_26887(X) ) )).

fof(just130,axiom,(
    ! [X] :
      ( tptpcol_11_26887(X)
     => isa(X,c_tptpcol_11_26887) ) )).

% Cyc Constant #156483:
fof(just131,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_10_26886)
     => tptpcol_10_26886(X) ) )).

fof(just132,axiom,(
    ! [X] :
      ( tptpcol_10_26886(X)
     => isa(X,c_tptpcol_10_26886) ) )).

% Cyc Constant #156482:
fof(just133,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_9_26885)
     => tptpcol_9_26885(X) ) )).

fof(just134,axiom,(
    ! [X] :
      ( tptpcol_9_26885(X)
     => isa(X,c_tptpcol_9_26885) ) )).

% Cyc Constant #156226:
fof(just135,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_8_26629)
     => tptpcol_8_26629(X) ) )).

fof(just136,axiom,(
    ! [X] :
      ( tptpcol_8_26629(X)
     => isa(X,c_tptpcol_8_26629) ) )).

% Cyc Constant #156225:
fof(just137,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_7_26628)
     => tptpcol_7_26628(X) ) )).

fof(just138,axiom,(
    ! [X] :
      ( tptpcol_7_26628(X)
     => isa(X,c_tptpcol_7_26628) ) )).

% Cyc Constant #156224:
fof(just139,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_6_26627)
     => tptpcol_6_26627(X) ) )).

fof(just140,axiom,(
    ! [X] :
      ( tptpcol_6_26627(X)
     => isa(X,c_tptpcol_6_26627) ) )).

% Cyc Constant #154176:
fof(just141,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_5_24579)
     => tptpcol_5_24579(X) ) )).

fof(just142,axiom,(
    ! [X] :
      ( tptpcol_5_24579(X)
     => isa(X,c_tptpcol_5_24579) ) )).

% Cyc Constant #154175:
fof(just143,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_4_24578)
     => tptpcol_4_24578(X) ) )).

fof(just144,axiom,(
    ! [X] :
      ( tptpcol_4_24578(X)
     => isa(X,c_tptpcol_4_24578) ) )).

% Cyc Constant #145983:
fof(just145,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_3_16386)
     => tptpcol_3_16386(X) ) )).

fof(just146,axiom,(
    ! [X] :
      ( tptpcol_3_16386(X)
     => isa(X,c_tptpcol_3_16386) ) )).

% Cyc Constant #129598:
fof(just147,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_1_1)
     => tptpcol_1_1(X) ) )).

fof(just148,axiom,(
    ! [X] :
      ( tptpcol_1_1(X)
     => isa(X,c_tptpcol_1_1) ) )).

% Cyc Constant #129599:
fof(just149,axiom,(
    ! [X] :
      ( isa(X,c_tptpcol_2_2)
     => tptpcol_2_2(X) ) )).

fof(just150,axiom,(
    ! [X] :
      ( tptpcol_2_2(X)
     => isa(X,c_tptpcol_2_2) ) )).

% Cyc Constant #0:
fof(just151,axiom,(
    ! [ARG1,INS] :
      ( genls(ARG1,INS)
     => collection(INS) ) )).

fof(just152,axiom,(
    ! [ARG1,INS] :
      ( genls(ARG1,INS)
     => collection(INS) ) )).

fof(just153,axiom,(
    ! [INS,ARG2] :
      ( genls(INS,ARG2)
     => collection(INS) ) )).

fof(just154,axiom,(
    ! [INS,ARG2] :
      ( genls(INS,ARG2)
     => collection(INS) ) )).

fof(just155,axiom,(
    ! [X,Y,Z] :
      ( ( genls(X,Y)
        & genls(Y,Z) )
     => genls(X,Z) ) )).

fof(just156,axiom,(
    ! [X] :
      ( collection(X)
     => genls(X,X) ) )).

fof(just157,axiom,(
    ! [X] :
      ( collection(X)
     => genls(X,X) ) )).

fof(just158,axiom,(
    ! [OLD,ARG2,NEW] :
      ( ( genls(OLD,ARG2)
        & genls(NEW,OLD) )
     => genls(NEW,ARG2) ) )).

fof(just159,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( genls(ARG1,OLD)
        & genls(OLD,NEW) )
     => genls(ARG1,NEW) ) )).

% Cyc Constant #127156:
fof(just160,axiom,(
    ! [X] :
      ( isa(X,c_transitivebinarypredicate)
     => transitivebinarypredicate(X) ) )).

fof(just161,axiom,(
    ! [X] :
      ( transitivebinarypredicate(X)
     => isa(X,c_transitivebinarypredicate) ) )).

% Cyc Constant #72115:
fof(just162,axiom,(
    ! [ARG1,INS] :
      ( isa(ARG1,INS)
     => collection(INS) ) )).

fof(just163,axiom,(
    ! [ARG1,INS] :
      ( isa(ARG1,INS)
     => collection(INS) ) )).

fof(just164,axiom,(
    ! [INS,ARG2] :
      ( isa(INS,ARG2)
     => thing(INS) ) )).

fof(just165,axiom,(
    ! [INS,ARG2] :
      ( isa(INS,ARG2)
     => thing(INS) ) )).

fof(just166,axiom,(
    ! [ARG1,OLD,NEW] :
      ( ( isa(ARG1,OLD)
        & genls(OLD,NEW) )
     => isa(ARG1,NEW) ) )).

% Cyc Constant #95028:
fof(just167,axiom,(
    mtvisible(c_universalvocabularymt) )).

% Cyc Constant #19550:
fof(just168,axiom,(
    ! [SPECMT,GENLMT] :
      ( ( mtvisible(SPECMT)
        & genlmt(SPECMT,GENLMT) )
     => mtvisible(GENLMT) ) )).

fof(just169,axiom,(
    ! [ARG1,INS] :
      ( genlmt(ARG1,INS)
     => microtheory(INS) ) )).

fof(just170,axiom,(
    ! [ARG1,INS] :
      ( genlmt(ARG1,INS)
     => microtheory(INS) ) )).

fof(just171,axiom,(
    ! [INS,ARG2] :
      ( genlmt(INS,ARG2)
     => microtheory(INS) ) )).

fof(just172,axiom,(
    ! [INS,ARG2] :
      ( genlmt(INS,ARG2)
     => microtheory(INS) ) )).

fof(just173,axiom,(
    ! [X,Y,Z] :
      ( ( genlmt(X,Y)
        & genlmt(Y,Z) )
     => genlmt(X,Z) ) )).

fof(just174,axiom,(
    ! [X] :
      ( microtheory(X)
     => genlmt(X,X) ) )).

fof(just175,axiom,(
    ! [X] :
      ( microtheory(X)
     => genlmt(X,X) ) )).

% Cyc Constant #27757:
fof(just176,axiom,(
    mtvisible(c_basekb) )).

fof(query49,conjecture,
    ( mtvisible(c_unitedstatesgeographypeoplemt)
   => disjointwith(c_tptpcol_16_26926,c_tptpcol_16_92269) )).

%------------------------------------------------------------------------------