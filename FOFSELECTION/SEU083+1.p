%------------------------------------------------------------------------------
% File     : SEU083+1 : TPTP v6.1.0. Released v3.2.0.
% Domain   : Set theory
% Problem  : Finite sets, theorem 14
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Dar90] Darmochwal (1990), Finite Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : finset_1__t14_finset_1 [Urb06]

% Status   : Theorem
% Rating   : 0.08 v6.1.0, 0.07 v6.0.0, 0.04 v5.4.0, 0.07 v5.3.0, 0.11 v5.2.0, 0.00 v4.0.1, 0.04 v3.7.0, 0.00 v3.2.0
% Syntax   : Number of formulae    :   62 (  10 unit)
%            Number of atoms       :  188 (   5 equality)
%            Maximal formula depth :   12 (   5 average)
%            Number of connectives :  147 (  21 ~  ;   1  |;  97  &)
%                                         (   1 <=>;  27 =>;   0 <=)
%                                         (   0 <~>;   0 ~|;   0 ~&)
%            Number of predicates  :   19 (   0 propositional; 1-2 arity)
%            Number of functors    :    4 (   2 constant; 0-2 arity)
%            Number of variables   :   83 (   2 singleton;  57 !;  26 ?)
%            Maximal term depth    :    2 (   1 average)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(reflexivity_r1_tarski,axiom,(
    ! [A,B] : subset(A,A) )).

fof(antisymmetry_r2_hidden,axiom,(
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) )).

fof(fc4_relat_1,axiom,
    ( empty(empty_set)
    & relation(empty_set) )).

fof(fc12_relat_1,axiom,
    ( empty(empty_set)
    & relation(empty_set)
    & relation_empty_yielding(empty_set) )).

fof(fc2_ordinal1,axiom,
    ( relation(empty_set)
    & relation_empty_yielding(empty_set)
    & function(empty_set)
    & one_to_one(empty_set)
    & empty(empty_set)
    & epsilon_transitive(empty_set)
    & epsilon_connected(empty_set)
    & ordinal(empty_set) )).

fof(fc1_xboole_0,axiom,(
    empty(empty_set) )).

fof(t1_boole,axiom,(
    ! [A] : set_union2(A,empty_set) = A )).

fof(t1_subset,axiom,(
    ! [A,B] :
      ( in(A,B)
     => element(A,B) ) )).

fof(t4_subset,axiom,(
    ! [A,B,C] :
      ( ( in(A,B)
        & element(B,powerset(C)) )
     => element(A,C) ) )).

fof(t5_subset,axiom,(
    ! [A,B,C] :
      ~ ( in(A,B)
        & element(B,powerset(C))
        & empty(C) ) )).

fof(existence_m1_subset_1,axiom,(
    ! [A] :
    ? [B] : element(B,A) )).

fof(cc1_finset_1,axiom,(
    ! [A] :
      ( empty(A)
     => finite(A) ) )).

fof(cc2_finset_1,axiom,(
    ! [A] :
      ( finite(A)
     => ! [B] :
          ( element(B,powerset(A))
         => finite(B) ) ) )).

fof(cc1_funct_1,axiom,(
    ! [A] :
      ( empty(A)
     => function(A) ) )).

fof(cc2_funct_1,axiom,(
    ! [A] :
      ( ( relation(A)
        & empty(A)
        & function(A) )
     => ( relation(A)
        & function(A)
        & one_to_one(A) ) ) )).

fof(fc2_relat_1,axiom,(
    ! [A,B] :
      ( ( relation(A)
        & relation(B) )
     => relation(set_union2(A,B)) ) )).

fof(cc1_relat_1,axiom,(
    ! [A] :
      ( empty(A)
     => relation(A) ) )).

fof(fc8_arytm_3,axiom,(
    ~ empty(positive_rationals) )).

fof(cc1_arytm_3,axiom,(
    ! [A] :
      ( ordinal(A)
     => ! [B] :
          ( element(B,A)
         => ( epsilon_transitive(B)
            & epsilon_connected(B)
            & ordinal(B) ) ) ) )).

fof(cc2_arytm_3,axiom,(
    ! [A] :
      ( ( empty(A)
        & ordinal(A) )
     => ( epsilon_transitive(A)
        & epsilon_connected(A)
        & ordinal(A)
        & natural(A) ) ) )).

fof(cc4_arytm_3,axiom,(
    ! [A] :
      ( element(A,positive_rationals)
     => ( ordinal(A)
       => ( epsilon_transitive(A)
          & epsilon_connected(A)
          & ordinal(A)
          & natural(A) ) ) ) )).

fof(cc1_ordinal1,axiom,(
    ! [A] :
      ( ordinal(A)
     => ( epsilon_transitive(A)
        & epsilon_connected(A) ) ) )).

fof(cc2_ordinal1,axiom,(
    ! [A] :
      ( ( epsilon_transitive(A)
        & epsilon_connected(A) )
     => ordinal(A) ) )).

fof(cc3_ordinal1,axiom,(
    ! [A] :
      ( empty(A)
     => ( epsilon_transitive(A)
        & epsilon_connected(A)
        & ordinal(A) ) ) )).

fof(fc1_subset_1,axiom,(
    ! [A] : ~ empty(powerset(A)) )).

fof(fc2_xboole_0,axiom,(
    ! [A,B] :
      ( ~ empty(A)
     => ~ empty(set_union2(A,B)) ) )).

fof(fc3_xboole_0,axiom,(
    ! [A,B] :
      ( ~ empty(A)
     => ~ empty(set_union2(B,A)) ) )).

fof(t2_subset,axiom,(
    ! [A,B] :
      ( element(A,B)
     => ( empty(B)
        | in(A,B) ) ) )).

fof(t3_subset,axiom,(
    ! [A,B] :
      ( element(A,powerset(B))
    <=> subset(A,B) ) )).

fof(t6_boole,axiom,(
    ! [A] :
      ( empty(A)
     => A = empty_set ) )).

fof(t7_boole,axiom,(
    ! [A,B] :
      ~ ( in(A,B)
        & empty(B) ) )).

fof(t8_boole,axiom,(
    ! [A,B] :
      ~ ( empty(A)
        & A != B
        & empty(B) ) )).

fof(commutativity_k2_xboole_0,axiom,(
    ! [A,B] : set_union2(A,B) = set_union2(B,A) )).

fof(idempotence_k2_xboole_0,axiom,(
    ! [A,B] : set_union2(A,A) = A )).

fof(fc9_finset_1,axiom,(
    ! [A,B] :
      ( ( finite(A)
        & finite(B) )
     => finite(set_union2(A,B)) ) )).

fof(rc1_finset_1,axiom,(
    ? [A] :
      ( ~ empty(A)
      & finite(A) ) )).

fof(rc2_finset_1,axiom,(
    ! [A] :
    ? [B] :
      ( element(B,powerset(A))
      & empty(B)
      & relation(B)
      & function(B)
      & one_to_one(B)
      & epsilon_transitive(B)
      & epsilon_connected(B)
      & ordinal(B)
      & natural(B)
      & finite(B) ) )).

fof(rc3_finset_1,axiom,(
    ! [A] :
      ( ~ empty(A)
     => ? [B] :
          ( element(B,powerset(A))
          & ~ empty(B)
          & finite(B) ) ) )).

fof(rc1_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & function(A) ) )).

fof(rc2_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & empty(A)
      & function(A) ) )).

fof(rc3_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & function(A)
      & one_to_one(A) ) )).

fof(rc4_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & relation_empty_yielding(A)
      & function(A) ) )).

fof(rc5_funct_1,axiom,(
    ? [A] :
      ( relation(A)
      & relation_non_empty(A)
      & function(A) ) )).

fof(rc1_ordinal2,axiom,(
    ? [A] :
      ( epsilon_transitive(A)
      & epsilon_connected(A)
      & ordinal(A)
      & being_limit_ordinal(A) ) )).

fof(rc2_ordinal2,axiom,(
    ? [A] :
      ( relation(A)
      & function(A)
      & transfinite_sequence(A)
      & ordinal_yielding(A) ) )).

fof(rc1_relat_1,axiom,(
    ? [A] :
      ( empty(A)
      & relation(A) ) )).

fof(rc2_relat_1,axiom,(
    ? [A] :
      ( ~ empty(A)
      & relation(A) ) )).

fof(rc3_relat_1,axiom,(
    ? [A] :
      ( relation(A)
      & relation_empty_yielding(A) ) )).

fof(rc1_arytm_3,axiom,(
    ? [A] :
      ( ~ empty(A)
      & epsilon_transitive(A)
      & epsilon_connected(A)
      & ordinal(A)
      & natural(A) ) )).

fof(rc2_arytm_3,axiom,(
    ? [A] :
      ( element(A,positive_rationals)
      & ~ empty(A)
      & epsilon_transitive(A)
      & epsilon_connected(A)
      & ordinal(A) ) )).

fof(rc3_arytm_3,axiom,(
    ? [A] :
      ( element(A,positive_rationals)
      & empty(A)
      & epsilon_transitive(A)
      & epsilon_connected(A)
      & ordinal(A)
      & natural(A) ) )).

fof(rc1_ordinal1,axiom,(
    ? [A] :
      ( epsilon_transitive(A)
      & epsilon_connected(A)
      & ordinal(A) ) )).

fof(rc2_ordinal1,axiom,(
    ? [A] :
      ( relation(A)
      & function(A)
      & one_to_one(A)
      & empty(A)
      & epsilon_transitive(A)
      & epsilon_connected(A)
      & ordinal(A) ) )).

fof(rc3_ordinal1,axiom,(
    ? [A] :
      ( ~ empty(A)
      & epsilon_transitive(A)
      & epsilon_connected(A)
      & ordinal(A) ) )).

fof(rc4_ordinal1,axiom,(
    ? [A] :
      ( relation(A)
      & function(A)
      & transfinite_sequence(A) ) )).

fof(rc1_subset_1,axiom,(
    ! [A] :
      ( ~ empty(A)
     => ? [B] :
          ( element(B,powerset(A))
          & ~ empty(B) ) ) )).

fof(rc2_subset_1,axiom,(
    ! [A] :
    ? [B] :
      ( element(B,powerset(A))
      & empty(B) ) )).

fof(rc1_xboole_0,axiom,(
    ? [A] : empty(A) )).

fof(rc2_xboole_0,axiom,(
    ? [A] : ~ empty(A) )).

fof(rc1_funcop_1,axiom,(
    ? [A] :
      ( relation(A)
      & function(A)
      & function_yielding(A) ) )).

fof(t14_finset_1,conjecture,(
    ! [A,B] :
      ( ( finite(A)
        & finite(B) )
     => finite(set_union2(A,B)) ) )).

fof(l3_finset_1,axiom,(
    ! [A,B] :
      ( ( finite(A)
        & finite(B) )
     => finite(set_union2(A,B)) ) )).
%------------------------------------------------------------------------------