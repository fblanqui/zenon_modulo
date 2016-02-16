%------------------------------------------------------------------------------
% File     : COM022+1 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Computing Theory
% Problem  : Newman's lemma on rewriting systems 03_01_07, 00 expansion
% Version  : Especial.
% English  :

% Refs     : [VLP07] Verchinine et al. (2007), System for Automated Deduction
%          : [PV+07] Paskevich et al. (2007), Reasoning Inside a Formula an
%          : [Pas08] Paskevich (2008), Email to G. Sutcliffe
% Source   : [Pas08]
% Names    : newman_03_01_07.00 [Pas08]

% Status   : Theorem
% Rating   : 0.16 v6.1.0, 0.20 v6.0.0, 0.17 v5.5.0, 0.33 v5.4.0, 0.32 v5.3.0, 0.33 v5.2.0, 0.25 v5.1.0, 0.38 v4.1.0, 0.43 v4.0.1, 0.57 v4.0.0
% Syntax   : Number of formulae    :   19 (   1 unit)
%            Number of atoms       :  115 (   1 equality)
%            Maximal formula depth :   18 (   7 average)
%            Number of connectives :   97 (   1 ~  ;   2  |;  59  &)
%                                         (   6 <=>;  29 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   11 (   0 propositional; 1-3 arity)
%            Number of functors    :    4 (   4 constant; 0-0 arity)
%            Number of variables   :   54 (   0 singleton;  43 !;  11 ?)
%            Maximal term depth    :    1 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Problem generated by the SAD system [VLP07]
%------------------------------------------------------------------------------
fof(mElmSort,axiom,(
    ! [W0] :
      ( aElement0(W0)
     => $true ) )).

fof(mRelSort,axiom,(
    ! [W0] :
      ( aRewritingSystem0(W0)
     => $true ) )).

fof(mReduct,axiom,(
    ! [W0,W1] :
      ( ( aElement0(W0)
        & aRewritingSystem0(W1) )
     => ! [W2] :
          ( aReductOfIn0(W2,W0,W1)
         => aElement0(W2) ) ) )).

fof(mWFOrd,axiom,(
    ! [W0,W1] :
      ( ( aElement0(W0)
        & aElement0(W1) )
     => ( iLess0(W0,W1)
       => $true ) ) )).

fof(mTCbr,axiom,(
    ! [W0,W1,W2] :
      ( ( aElement0(W0)
        & aRewritingSystem0(W1)
        & aElement0(W2) )
     => ( sdtmndtplgtdt0(W0,W1,W2)
       => $true ) ) )).

fof(mTCDef,definition,(
    ! [W0,W1,W2] :
      ( ( aElement0(W0)
        & aRewritingSystem0(W1)
        & aElement0(W2) )
     => ( sdtmndtplgtdt0(W0,W1,W2)
      <=> ( aReductOfIn0(W2,W0,W1)
          | ? [W3] :
              ( aElement0(W3)
              & aReductOfIn0(W3,W0,W1)
              & sdtmndtplgtdt0(W3,W1,W2) ) ) ) ) )).

fof(mTCTrans,axiom,(
    ! [W0,W1,W2,W3] :
      ( ( aElement0(W0)
        & aRewritingSystem0(W1)
        & aElement0(W2)
        & aElement0(W3) )
     => ( ( sdtmndtplgtdt0(W0,W1,W2)
          & sdtmndtplgtdt0(W2,W1,W3) )
       => sdtmndtplgtdt0(W0,W1,W3) ) ) )).

fof(mTCRDef,definition,(
    ! [W0,W1,W2] :
      ( ( aElement0(W0)
        & aRewritingSystem0(W1)
        & aElement0(W2) )
     => ( sdtmndtasgtdt0(W0,W1,W2)
      <=> ( W0 = W2
          | sdtmndtplgtdt0(W0,W1,W2) ) ) ) )).

fof(mTCRTrans,axiom,(
    ! [W0,W1,W2,W3] :
      ( ( aElement0(W0)
        & aRewritingSystem0(W1)
        & aElement0(W2)
        & aElement0(W3) )
     => ( ( sdtmndtasgtdt0(W0,W1,W2)
          & sdtmndtasgtdt0(W2,W1,W3) )
       => sdtmndtasgtdt0(W0,W1,W3) ) ) )).

fof(mCRDef,definition,(
    ! [W0] :
      ( aRewritingSystem0(W0)
     => ( isConfluent0(W0)
      <=> ! [W1,W2,W3] :
            ( ( aElement0(W1)
              & aElement0(W2)
              & aElement0(W3)
              & sdtmndtasgtdt0(W1,W0,W2)
              & sdtmndtasgtdt0(W1,W0,W3) )
           => ? [W4] :
                ( aElement0(W4)
                & sdtmndtasgtdt0(W2,W0,W4)
                & sdtmndtasgtdt0(W3,W0,W4) ) ) ) ) )).

fof(mWCRDef,definition,(
    ! [W0] :
      ( aRewritingSystem0(W0)
     => ( isLocallyConfluent0(W0)
      <=> ! [W1,W2,W3] :
            ( ( aElement0(W1)
              & aElement0(W2)
              & aElement0(W3)
              & aReductOfIn0(W2,W1,W0)
              & aReductOfIn0(W3,W1,W0) )
           => ? [W4] :
                ( aElement0(W4)
                & sdtmndtasgtdt0(W2,W0,W4)
                & sdtmndtasgtdt0(W3,W0,W4) ) ) ) ) )).

fof(mTermin,definition,(
    ! [W0] :
      ( aRewritingSystem0(W0)
     => ( isTerminating0(W0)
      <=> ! [W1,W2] :
            ( ( aElement0(W1)
              & aElement0(W2) )
           => ( sdtmndtplgtdt0(W1,W0,W2)
             => iLess0(W2,W1) ) ) ) ) )).

fof(mNFRDef,definition,(
    ! [W0,W1] :
      ( ( aElement0(W0)
        & aRewritingSystem0(W1) )
     => ! [W2] :
          ( aNormalFormOfIn0(W2,W0,W1)
        <=> ( aElement0(W2)
            & sdtmndtasgtdt0(W0,W1,W2)
            & ~ ? [W3] : aReductOfIn0(W3,W2,W1) ) ) ) )).

fof(mTermNF,axiom,(
    ! [W0] :
      ( ( aRewritingSystem0(W0)
        & isTerminating0(W0) )
     => ! [W1] :
          ( aElement0(W1)
         => ? [W2] : aNormalFormOfIn0(W2,W1,W0) ) ) )).

fof(m__656,hypothesis,(
    aRewritingSystem0(xR) )).

fof(m__656_01,hypothesis,
    ( isLocallyConfluent0(xR)
    & isTerminating0(xR) )).

fof(m__731,hypothesis,
    ( aElement0(xa)
    & aElement0(xb)
    & aElement0(xc) )).

fof(m__715,hypothesis,(
    ! [W0,W1,W2] :
      ( ( aElement0(W0)
        & aElement0(W1)
        & aElement0(W2)
        & sdtmndtasgtdt0(W0,xR,W1)
        & sdtmndtasgtdt0(W0,xR,W2) )
     => ( iLess0(W0,xa)
       => ? [W3] :
            ( aElement0(W3)
            & sdtmndtasgtdt0(W1,xR,W3)
            & sdtmndtasgtdt0(W2,xR,W3) ) ) ) )).

fof(m__,conjecture,
    ( ( ( sdtmndtplgtdt0(xa,xR,xb)
        & sdtmndtplgtdt0(xa,xR,xc) )
     => ? [W0] :
          ( aElement0(W0)
          & aReductOfIn0(W0,xa,xR)
          & sdtmndtasgtdt0(W0,xR,xb)
          & ? [W1] :
              ( aElement0(W1)
              & aReductOfIn0(W1,xa,xR)
              & sdtmndtasgtdt0(W1,xR,xc)
              & ? [W2] :
                  ( aElement0(W2)
                  & sdtmndtasgtdt0(W0,xR,W2)
                  & sdtmndtasgtdt0(W1,xR,W2)
                  & ? [W3] :
                      ( aNormalFormOfIn0(W3,W2,xR)
                      & sdtmndtasgtdt0(xb,xR,W3)
                      & sdtmndtasgtdt0(xc,xR,W3) ) ) ) ) )
   => ( ( sdtmndtasgtdt0(xa,xR,xb)
        & sdtmndtasgtdt0(xa,xR,xc) )
     => ? [W0] :
          ( aElement0(W0)
          & sdtmndtasgtdt0(xb,xR,W0)
          & sdtmndtasgtdt0(xc,xR,W0) ) ) )).

%------------------------------------------------------------------------------