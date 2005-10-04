(*  Copyright 2004 INRIA  *)
(*  $Id: zenon_coqbool.v,v 1.4.2.1 2005-10-03 13:25:32 doligez Exp $  *)

Require Import Bool.

Definition __g_not_b := negb.
Definition __g_and_b := andb.
Definition __g_or_b := orb.
Definition __g_xor_b := xorb.

Lemma zenon_coqbool_false : Is_true false -> False.
Proof.
  unfold Is_true.
  auto.
Qed.

Lemma zenon_coqbool_nottrue : ~ Is_true true -> False.
Proof.
  unfold Is_true.
  auto.
Qed.

Lemma zenon_coqbool_falsetrue : false = true -> False.
Proof.
  congruence.
Qed.

Lemma zenon_coqbool_truefalse : true = false -> False.
Proof.
  congruence.
Qed.

Lemma zenon_coqbool_not :
 forall a : bool, (~ Is_true a -> False) -> Is_true (__g_not_b a) -> False.
Proof.
  unfold Is_true.
  unfold __g_not_b.
  unfold negb.
  destruct a; tauto.
Qed.

Lemma zenon_coqbool_notnot :
 forall a : bool, (Is_true a -> False) -> ~ Is_true (__g_not_b a) -> False.
Proof.
  unfold Is_true.
  unfold __g_not_b.
  unfold negb.
  destruct a; tauto.
Qed.

Lemma zenon_coqbool_and :
 forall a b : bool,
 (Is_true a /\ Is_true b -> False) -> Is_true (__g_and_b a b) -> False.
Proof.
  unfold Is_true.
  unfold __g_and_b.
  unfold andb.
  unfold ifb.
  destruct a; tauto.
Qed.

Lemma zenon_coqbool_notand :
 forall a b : bool,
 (~ (Is_true a /\ Is_true b) -> False) -> ~ Is_true (__g_and_b a b) -> False.
Proof.
  unfold Is_true.
  unfold __g_and_b.
  unfold andb.
  unfold ifb.
  destruct a; tauto.
Qed.

Lemma zenon_coqbool_or :
 forall a b : bool,
 (Is_true a \/ Is_true b -> False) -> Is_true (__g_or_b a b) -> False.
Proof.
  unfold Is_true.
  unfold __g_or_b.
  unfold orb.
  unfold ifb.
  destruct a; tauto.
Qed.

Lemma zenon_coqbool_notor :
 forall a b : bool,
 (~ (Is_true a \/ Is_true b) -> False) -> ~ Is_true (__g_or_b a b) -> False.
Proof.
  unfold Is_true.
  unfold __g_or_b.
  unfold orb.
  unfold ifb.
  destruct a; tauto.
Qed.

Lemma zenon_coqbool_xor :
 forall a b : bool,
 (~ (Is_true a <-> Is_true b) -> False) -> Is_true (__g_xor_b a b) -> False.
Proof.
  unfold Is_true.
  unfold __g_xor_b.
  unfold xorb.
  unfold ifb.
  destruct a; destruct b; tauto.
Qed.

Lemma zenon_coqbool_notxor :
 forall a b : bool,
 ((Is_true a <-> Is_true b) -> False) -> ~ Is_true (__g_xor_b a b) -> False.
Proof.
  unfold Is_true.
  unfold __g_xor_b.
  unfold xorb.
  unfold ifb.
  destruct a; destruct b; tauto.
Qed.

Definition zenon_coqbool_false_s := zenon_coqbool_false.
Definition zenon_coqbool_nottrue_s := zenon_coqbool_nottrue.
Definition zenon_coqbool_not_s :=
  fun A c h => zenon_coqbool_not A h c
.
Definition zenon_coqbool_notnot_s :=
  fun A c h => zenon_coqbool_notnot A h c
.
Definition zenon_coqbool_and_s :=
  fun A B c h => zenon_coqbool_and A B h c
.
Definition zenon_coqbool_notand_s :=
  fun A B c h => zenon_coqbool_notand A B h c
.
Definition zenon_coqbool_or_s :=
  fun A B c h => zenon_coqbool_or A B h c
.
Definition zenon_coqbool_notor_s :=
  fun A B c h => zenon_coqbool_notor A B h c
.
Definition zenon_coqbool_xor_s :=
  fun A B c h => zenon_coqbool_xor A B h c
.
Definition zenon_coqbool_notxor_s :=
  fun A B c h => zenon_coqbool_notxor A B h c
.