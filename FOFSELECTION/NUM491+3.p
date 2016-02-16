%------------------------------------------------------------------------------
% File     : NUM491+3 : TPTP v6.1.0. Released v4.0.0.
% Domain   : Number Theory
% Problem  : Square root of a prime is irrational 14_01_03_04, 02 expansion
% Version  : Especial.
% English  :

% Refs     : [LPV06] Lyaletski et al. (2006), SAD as a Mathematical Assista
%          : [VLP07] Verchinine et al. (2007), System for Automated Deduction
%          : [Pas08] Paskevich (2008), Email to G. Sutcliffe
% Source   : [Pas08]
% Names    : primes_14_01_03_04.02 [Pas08]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.07 v6.0.0, 0.04 v5.5.0, 0.11 v5.4.0, 0.14 v5.3.0, 0.19 v5.2.0, 0.15 v5.1.0, 0.29 v5.0.0, 0.33 v4.1.0, 0.35 v4.0.1, 0.61 v4.0.0
% Syntax   : Number of formulae    :   48 (   3 unit)
%            Number of atoms       :  237 (  80 equality)
%            Maximal formula depth :   16 (   6 average)
%            Number of connectives :  214 (  25 ~  ;  14  |; 106  &)
%                                         (   5 <=>;  64 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :    6 (   0 propositional; 1-2 arity)
%            Number of functors    :   10 (   6 constant; 0-2 arity)
%            Number of variables   :   96 (   0 singleton;  84 !;  12 ?)
%            Maximal term depth    :    3 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Problem generated by the SAD system [VLP07]
%------------------------------------------------------------------------------
fof(mNatSort,axiom,(
    ! [W0] :
      ( aNaturalNumber0(W0)
     => $true ) )).

fof(mSortsC,axiom,(
    aNaturalNumber0(sz00) )).

fof(mSortsC_01,axiom,
    ( aNaturalNumber0(sz10)
    & sz10 != sz00 )).

fof(mSortsB,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => aNaturalNumber0(sdtpldt0(W0,W1)) ) )).

fof(mSortsB_02,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => aNaturalNumber0(sdtasdt0(W0,W1)) ) )).

fof(mAddComm,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => sdtpldt0(W0,W1) = sdtpldt0(W1,W0) ) )).

fof(mAddAsso,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => sdtpldt0(sdtpldt0(W0,W1),W2) = sdtpldt0(W0,sdtpldt0(W1,W2)) ) )).

fof(m_AddZero,axiom,(
    ! [W0] :
      ( aNaturalNumber0(W0)
     => ( sdtpldt0(W0,sz00) = W0
        & W0 = sdtpldt0(sz00,W0) ) ) )).

fof(mMulComm,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => sdtasdt0(W0,W1) = sdtasdt0(W1,W0) ) )).

fof(mMulAsso,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => sdtasdt0(sdtasdt0(W0,W1),W2) = sdtasdt0(W0,sdtasdt0(W1,W2)) ) )).

fof(m_MulUnit,axiom,(
    ! [W0] :
      ( aNaturalNumber0(W0)
     => ( sdtasdt0(W0,sz10) = W0
        & W0 = sdtasdt0(sz10,W0) ) ) )).

fof(m_MulZero,axiom,(
    ! [W0] :
      ( aNaturalNumber0(W0)
     => ( sdtasdt0(W0,sz00) = sz00
        & sz00 = sdtasdt0(sz00,W0) ) ) )).

fof(mAMDistr,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => ( sdtasdt0(W0,sdtpldt0(W1,W2)) = sdtpldt0(sdtasdt0(W0,W1),sdtasdt0(W0,W2))
        & sdtasdt0(sdtpldt0(W1,W2),W0) = sdtpldt0(sdtasdt0(W1,W0),sdtasdt0(W2,W0)) ) ) )).

fof(mAddCanc,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => ( ( sdtpldt0(W0,W1) = sdtpldt0(W0,W2)
          | sdtpldt0(W1,W0) = sdtpldt0(W2,W0) )
       => W1 = W2 ) ) )).

fof(mMulCanc,axiom,(
    ! [W0] :
      ( aNaturalNumber0(W0)
     => ( W0 != sz00
       => ! [W1,W2] :
            ( ( aNaturalNumber0(W1)
              & aNaturalNumber0(W2) )
           => ( ( sdtasdt0(W0,W1) = sdtasdt0(W0,W2)
                | sdtasdt0(W1,W0) = sdtasdt0(W2,W0) )
             => W1 = W2 ) ) ) ) )).

fof(mZeroAdd,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( sdtpldt0(W0,W1) = sz00
       => ( W0 = sz00
          & W1 = sz00 ) ) ) )).

fof(mZeroMul,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( sdtasdt0(W0,W1) = sz00
       => ( W0 = sz00
          | W1 = sz00 ) ) ) )).

fof(mDefLE,definition,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( sdtlseqdt0(W0,W1)
      <=> ? [W2] :
            ( aNaturalNumber0(W2)
            & sdtpldt0(W0,W2) = W1 ) ) ) )).

fof(mDefDiff,definition,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( sdtlseqdt0(W0,W1)
       => ! [W2] :
            ( W2 = sdtmndt0(W1,W0)
          <=> ( aNaturalNumber0(W2)
              & sdtpldt0(W0,W2) = W1 ) ) ) ) )).

fof(mLERefl,axiom,(
    ! [W0] :
      ( aNaturalNumber0(W0)
     => sdtlseqdt0(W0,W0) ) )).

fof(mLEAsym,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( ( sdtlseqdt0(W0,W1)
          & sdtlseqdt0(W1,W0) )
       => W0 = W1 ) ) )).

fof(mLETran,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => ( ( sdtlseqdt0(W0,W1)
          & sdtlseqdt0(W1,W2) )
       => sdtlseqdt0(W0,W2) ) ) )).

fof(mLETotal,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( sdtlseqdt0(W0,W1)
        | ( W1 != W0
          & sdtlseqdt0(W1,W0) ) ) ) )).

fof(mMonAdd,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( ( W0 != W1
          & sdtlseqdt0(W0,W1) )
       => ! [W2] :
            ( aNaturalNumber0(W2)
           => ( sdtpldt0(W2,W0) != sdtpldt0(W2,W1)
              & sdtlseqdt0(sdtpldt0(W2,W0),sdtpldt0(W2,W1))
              & sdtpldt0(W0,W2) != sdtpldt0(W1,W2)
              & sdtlseqdt0(sdtpldt0(W0,W2),sdtpldt0(W1,W2)) ) ) ) ) )).

fof(mMonMul,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => ( ( W0 != sz00
          & W1 != W2
          & sdtlseqdt0(W1,W2) )
       => ( sdtasdt0(W0,W1) != sdtasdt0(W0,W2)
          & sdtlseqdt0(sdtasdt0(W0,W1),sdtasdt0(W0,W2))
          & sdtasdt0(W1,W0) != sdtasdt0(W2,W0)
          & sdtlseqdt0(sdtasdt0(W1,W0),sdtasdt0(W2,W0)) ) ) ) )).

fof(mLENTr,axiom,(
    ! [W0] :
      ( aNaturalNumber0(W0)
     => ( W0 = sz00
        | W0 = sz10
        | ( sz10 != W0
          & sdtlseqdt0(sz10,W0) ) ) ) )).

fof(mMonMul2,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( W0 != sz00
       => sdtlseqdt0(W1,sdtasdt0(W1,W0)) ) ) )).

fof(mIH,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( iLess0(W0,W1)
       => $true ) ) )).

fof(mIH_03,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( ( W0 != W1
          & sdtlseqdt0(W0,W1) )
       => iLess0(W0,W1) ) ) )).

fof(mDefDiv,definition,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( doDivides0(W0,W1)
      <=> ? [W2] :
            ( aNaturalNumber0(W2)
            & W1 = sdtasdt0(W0,W2) ) ) ) )).

fof(mDefQuot,definition,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( ( W0 != sz00
          & doDivides0(W0,W1) )
       => ! [W2] :
            ( W2 = sdtsldt0(W1,W0)
          <=> ( aNaturalNumber0(W2)
              & W1 = sdtasdt0(W0,W2) ) ) ) ) )).

fof(mDivTrans,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => ( ( doDivides0(W0,W1)
          & doDivides0(W1,W2) )
       => doDivides0(W0,W2) ) ) )).

fof(mDivSum,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => ( ( doDivides0(W0,W1)
          & doDivides0(W0,W2) )
       => doDivides0(W0,sdtpldt0(W1,W2)) ) ) )).

fof(mDivMin,axiom,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => ( ( doDivides0(W0,W1)
          & doDivides0(W0,sdtpldt0(W1,W2)) )
       => doDivides0(W0,W2) ) ) )).

fof(mDivLE,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( ( doDivides0(W0,W1)
          & W1 != sz00 )
       => sdtlseqdt0(W0,W1) ) ) )).

fof(mDivAsso,axiom,(
    ! [W0,W1] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1) )
     => ( ( W0 != sz00
          & doDivides0(W0,W1) )
       => ! [W2] :
            ( aNaturalNumber0(W2)
           => sdtasdt0(W2,sdtsldt0(W1,W0)) = sdtsldt0(sdtasdt0(W2,W1),W0) ) ) ) )).

fof(mDefPrime,definition,(
    ! [W0] :
      ( aNaturalNumber0(W0)
     => ( isPrime0(W0)
      <=> ( W0 != sz00
          & W0 != sz10
          & ! [W1] :
              ( ( aNaturalNumber0(W1)
                & doDivides0(W1,W0) )
             => ( W1 = sz10
                | W1 = W0 ) ) ) ) ) )).

fof(mPrimDiv,axiom,(
    ! [W0] :
      ( ( aNaturalNumber0(W0)
        & W0 != sz00
        & W0 != sz10 )
     => ? [W1] :
          ( aNaturalNumber0(W1)
          & doDivides0(W1,W0)
          & isPrime0(W1) ) ) )).

fof(m__1837,hypothesis,
    ( aNaturalNumber0(xn)
    & aNaturalNumber0(xm)
    & aNaturalNumber0(xp) )).

fof(m__1799,hypothesis,(
    ! [W0,W1,W2] :
      ( ( aNaturalNumber0(W0)
        & aNaturalNumber0(W1)
        & aNaturalNumber0(W2) )
     => ( ( ( ( W2 != sz00
              & W2 != sz10
              & ! [W3] :
                  ( ( aNaturalNumber0(W3)
                    & ? [W4] :
                        ( aNaturalNumber0(W4)
                        & W2 = sdtasdt0(W3,W4) )
                    & doDivides0(W3,W2) )
                 => ( W3 = sz10
                    | W3 = W2 ) ) )
            | isPrime0(W2) )
          & ( ? [W3] :
                ( aNaturalNumber0(W3)
                & sdtasdt0(W0,W1) = sdtasdt0(W2,W3) )
            | doDivides0(W2,sdtasdt0(W0,W1)) ) )
       => ( iLess0(sdtpldt0(sdtpldt0(W0,W1),W2),sdtpldt0(sdtpldt0(xn,xm),xp))
         => ( ( ? [W3] :
                  ( aNaturalNumber0(W3)
                  & W0 = sdtasdt0(W2,W3) )
              & doDivides0(W2,W0) )
            | ( ? [W3] :
                  ( aNaturalNumber0(W3)
                  & W1 = sdtasdt0(W2,W3) )
              & doDivides0(W2,W1) ) ) ) ) ) )).

fof(m__1860,hypothesis,
    ( xp != sz00
    & xp != sz10
    & ! [W0] :
        ( ( aNaturalNumber0(W0)
          & ( ? [W1] :
                ( aNaturalNumber0(W1)
                & xp = sdtasdt0(W0,W1) )
            | doDivides0(W0,xp) ) )
       => ( W0 = sz10
          | W0 = xp ) )
    & isPrime0(xp)
    & ? [W0] :
        ( aNaturalNumber0(W0)
        & sdtasdt0(xn,xm) = sdtasdt0(xp,W0) )
    & doDivides0(xp,sdtasdt0(xn,xm)) )).

fof(m__1870,hypothesis,
    ( ? [W0] :
        ( aNaturalNumber0(W0)
        & sdtpldt0(xp,W0) = xn )
    & sdtlseqdt0(xp,xn) )).

fof(m__1883,hypothesis,
    ( aNaturalNumber0(xr)
    & sdtpldt0(xp,xr) = xn
    & xr = sdtmndt0(xn,xp) )).

fof(m__1894,hypothesis,
    ( xr != xn
    & ? [W0] :
        ( aNaturalNumber0(W0)
        & sdtpldt0(xr,W0) = xn )
    & sdtlseqdt0(xr,xn) )).

fof(m__1924,hypothesis,(
    xn = sdtpldt0(xp,xr) )).

fof(m__1951,hypothesis,(
    sdtasdt0(xn,xm) = sdtpldt0(sdtasdt0(xp,xm),sdtasdt0(xr,xm)) )).

fof(m__1978,hypothesis,
    ( sdtpldt0(sdtasdt0(xp,xm),sdtasdt0(xr,xm)) = sdtasdt0(xn,xm)
    & sdtasdt0(xr,xm) = sdtmndt0(sdtasdt0(xn,xm),sdtasdt0(xp,xm)) )).

fof(m__,conjecture,
    ( ? [W0] :
        ( aNaturalNumber0(W0)
        & sdtasdt0(xp,xm) = sdtasdt0(xp,W0) )
    | doDivides0(xp,sdtasdt0(xp,xm)) )).

%------------------------------------------------------------------------------