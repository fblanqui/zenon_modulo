(*  Copyright 2008 INRIA  *)
Version.add "$Id: ext_focal.ml,v 1.10 2008-11-18 12:33:29 doligez Exp $";;

(* Extension for Coq's "bool" type, as used in focal. *)
(* Symbols:
     Is_true
     basics.and_b
     basics.or_b
     basics.xor_b
     basics.not_b
     basics.base_eq
     false
     true
     FOCAL.ifthenelse
     basics.crp
     basics.pair
     List.nil
     List.cons
 *)

open Printf;;

open Expr;;
open Misc;;
open Mlproof;;
open Node;;
open Phrase;;

let rec is_prefix n s1 s2 =
  if n >= String.length s1 then true
  else if n >= String.length s2 then false
  else if s1.[n] <> s2.[n] then false
  else is_prefix (n+1) s1 s2
;;

let chop_prefix s1 s2 =
  let l1 = String.length s1 in
  let l2 = String.length s2 in
  assert (String.sub s2 0 l1 = s1);
  String.sub s2 l1 (l2 - l1)
;;

let add_formula e = ();;
let remove_formula e = ();;

let wrong_arity s =
  Error.warn (sprintf "defined symbol %s is used with wrong arity" s)
;;

let istrue e = eapp ("Is_true", [e]);;
let isfalse e = enot (eapp ("Is_true", [e]));;

let newnodes_istrue e g =
  match e with
  | Eapp ("Is_true**basics.and_b", [e1; e2], _) ->
      let branches = [| [eand (istrue e1, istrue e2)] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "and", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Eapp ("Is_true**basics.or_b", [e1; e2], _) ->
      let branches = [| [eor (istrue e1, istrue e2)] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "or", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Eapp ("Is_true**basics.xor_b", [e1; e2], _) ->
      let branches = [| [enot (eequiv (istrue e1, istrue e2))] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "xor", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Eapp ("Is_true**basics.not_b", [e1], _) ->
      let branches = [| [isfalse e1] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "not", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Eapp (("Is_true**basics.base_eq" | "Is_true**basics._focop_eq_") as op,
          [e1; e2; e3], _) ->
     let branches = [| [eapp ("=", [e2; e3])] |] in
     let name = chop_prefix "Is_true**" op in
       [ Node {
         nconc = [e];
         nrule = Ext ("focal", "base_eq", [evar (name); e1; e2; e3]);
         nprio = Arity;
         ngoal = g;
         nbranches = branches;
       }; Stop ]
  | Enot (Eapp ("Is_true**basics.and_b", [e1; e2], _), _) ->
      let branches = [| [enot (eand (istrue e1, istrue e2))] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notand", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Enot (Eapp ("Is_true**basics.or_b", [e1; e2], _), _) ->
      let branches = [| [enot (eor (istrue e1, istrue e2))] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notor", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Enot (Eapp ("Is_true**basics.xor_b", [e1; e2], _), _) ->
      let branches = [| [eequiv (istrue e1, istrue e2)] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notxor", [e1; e2]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Enot (Eapp ("Is_true**basics.not_b", [e1], _), _) ->
      let branches = [| [istrue e1] |] in
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "notnot", [e1]);
        nprio = Arity;
        ngoal = g;
        nbranches = branches;
      }; Stop ]
  | Enot (Eapp (("Is_true**basics.base_eq" | "Is_true**basics._focop_eq_") as op,
                [e1; e2; e3], _), _) ->
     let branches = [| [enot (eapp ("=", [e2; e3]))] |] in
     let name = chop_prefix "Is_true**" op in
       [ Node {
         nconc = [e];
         nrule = Ext ("focal", "notbase_eq", [evar (name); e1; e2; e3]);
         nprio = Arity;
         ngoal = g;
         nbranches = branches;
       }; Stop ]
  | Eapp ("Is_true", [Evar ("true", _)], _) -> [Stop]
  | Enot (Eapp ("Is_true", [Evar ("false", _)], _), _) -> [Stop]

  | Eapp ("Is_true", [Evar ("false", _)], _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "false", []);
        nprio = Arity;
        ngoal = g;
        nbranches = [| |];
      }; Stop ]
  | Enot (Eapp ("Is_true", [Evar ("true", _)], _), _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "nottrue", []);
        nprio = Arity;
        ngoal = g;
        nbranches = [| |];
      }; Stop ]
  | Enot (Eapp ("=", [Evar ("true", _); Evar ("false", _)], _), _) -> [Stop]
  | Enot (Eapp ("=", [Evar ("false", _); Evar ("true", _)], _), _) -> [Stop]
  | Eapp ("=", [Evar ("true", _); Evar ("false", _)], _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "truefalse", []);
        nprio = Arity;
        ngoal = g;
        nbranches = [| |];
      }; Stop ]
  | Eapp ("=", [Evar ("false", _); Evar ("true", _)], _) ->
      [ Node {
        nconc = [e];
        nrule = Ext ("focal", "falsetrue", []);
        nprio = Arity;
        ngoal = g;
        nbranches = [| |];
      }; Stop ]
(*
  | Eapp ("Is_true", [Emeta _], _) -> FIXME TODO instancier par false
  | Enot (Eapp ("Is_true", [Emeta _], _) -> FIXME TODO instancier par true
*)
  | Eapp ("Is_true", [Eapp ("$fix", _, _) as e1], _) ->
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "istrue_true", [e1]);
          nprio = Arity;
          ngoal = g;
          nbranches = [| [eapp ("=", [e1; evar "true"])] |];
      } ]
  | Enot (Eapp ("Is_true", [Eapp ("$fix", _, _) as e1], _), _) ->
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "notistrue_false", [e1]);
          nprio = Arity;
          ngoal = g;
          nbranches = [| [eapp ("=", [e1; evar "false"])] |];
      } ]
  | Eapp ("Is_true", [Eapp (s, args, _)], _) when Index.has_def s ->
      begin try
        let (d, params, body) = Index.get_def s in
        let subst = List.map2 (fun x y -> (x,y)) params args in
        let unfolded = eapp ("Is_true", [substitute subst body]) in
        let branches = [| [unfolded] |] in
        [ Node {
          nconc = [e];
          nrule = Definition (d, e, unfolded);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
        }; Stop ]
      with
        | Invalid_argument "List.map2" -> wrong_arity s; []
        | Not_found -> assert false
      end
  | Enot (Eapp ("Is_true", [Eapp (s, args, _)], _), _) when Index.has_def s ->
      begin try
        let (d, params, body) = Index.get_def s in
        let subst = List.map2 (fun x y -> (x,y)) params args in
        let unfolded = enot (eapp ("Is_true", [substitute subst body])) in
        let branches = [| [unfolded] |] in
        [ Node {
            nconc = [e];
            nrule = Definition (d, e, unfolded);
            nprio = Arity;
            ngoal = g;
            nbranches = branches;
        }; Stop ]
      with
        | Invalid_argument "List.map2" -> wrong_arity s; []
        | Not_found -> assert false
      end
  | Eapp ("Is_true", [Eapp (s, args, _)], _) ->
      let branches = [| [eapp ("Is_true**" ^ s, args)] |] in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "merge", []);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Eapp (s, args, _) when is_prefix 0 "Is_true**" s ->
      let ss = chop_prefix "Is_true**" s in
      let branches = [| [eapp ("Is_true", [eapp (ss, args)])] |] in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "split", []);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      } ]
  | Enot (Eapp ("Is_true", [Eapp (s, args, _)], _), _) ->
      let branches = [| [enot (eapp ("Is_true**" ^ s, args))] |] in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "merge", []);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Enot (Eapp (s, args, _), _) when is_prefix 0 "Is_true**" s ->
      let ss = chop_prefix "Is_true**" s in
      let branches = [| [enot (eapp ("Is_true", [eapp (ss, args)]))] |] in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "split", []);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      } ]
  | _ -> []
;;

let ite_branches pat cond thn els =
  [| [istrue cond; pat thn]; [isfalse cond; pat els] |]
;;

let newnodes_ifthenelse e g =
  match e with
  | Eapp ("Is_true**FOCAL.ifthenelse", [cond; thn; els], _) ->
      let branches = ite_branches istrue cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_bool", [cond; thn; els]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Enot (Eapp ("Is_true**FOCAL.ifthenelse", [cond; thn; els], _), _) ->
      let branches = ite_branches isfalse cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_bool_n", [cond; thn; els]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Eapp (r, [Eapp ("FOCAL.ifthenelse", [cond; thn; els], _); e2], _)
    when Eqrel.any r ->
      let pat x = eapp (r, [x; e2]) in
      let branches = ite_branches pat cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_rel_l", [e]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Eapp (r, [e1; Eapp ("FOCAL.ifthenelse", [cond; thn; els], _)], _)
    when Eqrel.any r ->
      let pat x = eapp (r, [e1; x]) in
      let branches = ite_branches pat cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_rel_r", [e]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Enot (Eapp (r, [Eapp ("FOCAL.ifthenelse", [cond; thn; els], _); e2], _),_)
    when Eqrel.any r ->
      let pat x = enot (eapp (r, [x; e2])) in
      let branches = ite_branches pat cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_rel_nl", [e]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | Enot (Eapp (r, [e1; Eapp ("FOCAL.ifthenelse", [cond; thn; els], _)], _),_)
    when Eqrel.any r ->
      let pat x = enot (eapp (r, [e1; x])) in
      let branches = ite_branches pat cond thn els in
      [ Node {
          nconc = [e];
          nrule = Ext ("focal", "ite_rel_nr", [e]);
          nprio = Arity;
          ngoal = g;
          nbranches = branches;
      }; Stop ]
  | _ -> []
;;

let newnodes e g = newnodes_istrue e g @ newnodes_ifthenelse e g;;

let to_llargs tr_expr r =
  match r with
  | Ext (_, "and", [e1; e2]) ->
      let h = tr_expr (eand (istrue e1, istrue e2)) in
      let c = tr_expr (istrue (eapp ("basics.and_b", [e1; e2]))) in
      ("zenon_focal_and", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "or", [e1; e2]) ->
      let h = tr_expr (eor (istrue e1, istrue e2)) in
      let c = tr_expr (istrue (eapp ("basics.or_b", [e1; e2]))) in
      ("zenon_focal_or", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "xor", [e1; e2]) ->
      let h = tr_expr (enot (eequiv (istrue e1, istrue e2))) in
      let c = tr_expr (istrue (eapp ("basics.xor_b", [e1; e2]))) in
      ("zenon_focal_xor", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "not", [e1]) ->
      let h = tr_expr (enot (istrue e1)) in
      let c = tr_expr (istrue (eapp ("basics.not_b", [e1]))) in
      ("zenon_focal_not", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "base_eq", [Evar (name, _); e1; e2; e3]) ->
      let h = tr_expr (eapp ("=", [e2; e3])) in
      let c = tr_expr (istrue (eapp (name, [e1; e2; e3]))) in
      let eqdec = evar ("zenon_focal_eqdec") in
      ("coq_builtins.zenon_base_eq",
       List.map tr_expr [eqdec; e1; e2; e3], [c], [ [h] ])
  | Ext (_, "notand", [e1; e2]) ->
      let h = tr_expr (enot (eand (istrue e1, istrue e2))) in
      let c = tr_expr (enot (istrue (eapp ("basics.and_b", [e1; e2])))) in
      ("zenon_focal_notand", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "notor", [e1; e2]) ->
      let h = tr_expr (enot (eor (istrue e1, istrue e2))) in
      let c = tr_expr (enot (istrue (eapp ("basics.or_b", [e1; e2])))) in
      ("zenon_focal_notor", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "notxor", [e1; e2]) ->
      let h = tr_expr (eequiv (istrue e1, istrue e2)) in
      let c = tr_expr (enot (istrue (eapp ("basics.xor_b", [e1; e2])))) in
      ("zenon_focal_notxor", [tr_expr e1; tr_expr e2], [c], [ [h] ])
  | Ext (_, "notnot", [e1]) ->
      let h = tr_expr (istrue e1) in
      let c = tr_expr (enot (istrue (eapp ("basics.not_b", [e1])))) in
      ("zenon_focal_notnot", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "notbase_eq", [Evar (name, _); e1; e2; e3]) ->
      let h = tr_expr (enot (eapp ("=", [e2; e3]))) in
      let c = tr_expr (enot (istrue (eapp (name, [e1; e2; e3])))) in
      ("coq_builtins.zenon_notbase_eq",
       [tr_expr e1; tr_expr e2; tr_expr e3], [c], [ [h] ])
  | Ext (_, "false", []) ->
      let c = tr_expr (istrue (evar "false")) in
      ("zenon_focal_false", [], [c], []);
  | Ext (_, "nottrue", []) ->
      let c = tr_expr (enot (istrue (evar "true"))) in
      ("zenon_focal_nottrue", [], [c], []);
  | Ext (_, "falsetrue", []) ->
      let c = tr_expr (eapp ("=", [evar "false"; evar "true"])) in
      ("zenon_focal_falsetrue", [], [c], []);
  | Ext (_, "truefalse", []) ->
      let c = tr_expr (eapp ("=", [evar "true"; evar "false"])) in
      ("zenon_focal_truefalse", [], [c], []);
  | Ext (_, "merge", _) -> ("zenon_focal_merge", [], [], [])
  | Ext (_, "split", _) -> ("zenon_focal_split", [], [], [])

  | Ext (_, "ite_bool", ([cond; thn; els] as args)) ->
      let ht1 = tr_expr (istrue cond) in
      let ht2 = tr_expr (istrue thn) in
      let he1 = tr_expr (isfalse cond) in
      let he2 = tr_expr (istrue els) in
      let c = tr_expr (istrue (eapp ("FOCAL.ifthenelse", [cond; thn; els])))
      in
      ("zenon_focal_ite_bool", List.map tr_expr args, [c],
       [ [ht1; ht2]; [he1; he2] ])
  | Ext (_, "ite_bool_n", ([cond; thn; els] as args)) ->
      let ht1 = tr_expr (istrue cond) in
      let ht2 = tr_expr (isfalse thn) in
      let he1 = tr_expr (isfalse cond) in
      let he2 = tr_expr (isfalse els) in
      let c = tr_expr (isfalse (eapp ("FOCAL.ifthenelse", [cond; thn; els])))
      in
      ("zenon_focal_ite_bool_n", List.map tr_expr args, [c],
       [ [ht1; ht2]; [he1; he2] ])
  | Ext (_, "ite_rel_l",
         [Eapp (r, [Eapp ("FOCAL.ifthenelse", [c; t; e], _); e2], _) as a])
    ->
      let ht1 = tr_expr (istrue c) in
      let ht2 = tr_expr (eapp (r, [t; e2])) in
      let he1 = tr_expr (isfalse c) in
      let he2 = tr_expr (eapp (r, [e; e2])) in
      let concl = tr_expr a in
      let v1 = newvar () and v2 = newvar () in
      let rf = elam (v1, "?", elam (v2, "?", eapp (r, [v1; v2]))) in
      ("zenon_focal_ite_rel_l", List.map tr_expr [rf; c; t; e; e2],
       [concl], [ [ht1; ht2]; [he1; he2] ])
  | Ext (_, "ite_rel_r",
         [Eapp (r, [e1; Eapp ("FOCAL.ifthenelse", [c; t; e], _)], _) as a])
    ->
      let ht1 = tr_expr (istrue c) in
      let ht2 = tr_expr (eapp (r, [e1; t])) in
      let he1 = tr_expr (isfalse c) in
      let he2 = tr_expr (eapp (r, [e1; e])) in
      let concl = tr_expr a in
      let v1 = newvar () and v2 = newvar () in
      let rf = elam (v1, "?", elam (v2, "?", eapp (r, [v1; v2]))) in
      ("zenon_focal_ite_rel_r", List.map tr_expr [rf; e1; c; t; e],
       [concl], [ [ht1; ht2]; [he1; he2] ])
  | Ext (_, "ite_rel_nl",
         [Enot (Eapp (r, [Eapp ("FOCAL.ifthenelse",
                                [c; t; e], _); e2], _), _) as a])
    ->
      let ht1 = tr_expr (istrue c) in
      let ht2 = tr_expr (enot (eapp (r, [t; e2]))) in
      let he1 = tr_expr (isfalse c) in
      let he2 = tr_expr (enot (eapp (r, [e; e2]))) in
      let concl = tr_expr a in
      let v1 = newvar () and v2 = newvar () in
      let rf = elam (v1, "?", elam (v2, "?", eapp (r, [v1; v2]))) in
      ("zenon_focal_ite_rel_nl", List.map tr_expr [rf; c; t; e; e2],
       [concl], [ [ht1; ht2]; [he1; he2] ])
  | Ext (_, "ite_rel_nr",
         [Enot (Eapp (r, [e1; Eapp ("FOCAL.ifthenelse",
                                    [c; t; e], _)], _), _) as a])
    ->
      let ht1 = tr_expr (istrue c) in
      let ht2 = tr_expr (enot (eapp (r, [e1; t]))) in
      let he1 = tr_expr (isfalse c) in
      let he2 = tr_expr (enot (eapp (r, [e1; e]))) in
      let concl = tr_expr a in
      let v1 = newvar () and v2 = newvar () in
      let rf = elam (v1, "?", elam (v2, "?", eapp (r, [v1; v2]))) in
      ("zenon_focal_ite_rel_nr", List.map tr_expr [rf; e1; c; t; e],
       [concl], [ [ht1; ht2]; [he1; he2] ])
  | Ext (_, "istrue_true", [e1]) ->
     let h = tr_expr (eapp ("=", [e1; evar "true"])) in
     let c = tr_expr (istrue e1) in
     ("zenon_focal_istrue_true", [tr_expr e1], [c], [ [h] ])
  | Ext (_, "notistrue_false", [e1]) ->
     let h = tr_expr (eapp ("=", [e1; evar "false"])) in
     let c = tr_expr (enot (istrue e1)) in
     ("zenon_focal_notistrue_true", [tr_expr e1], [c], [ [h] ])
  | Ext (x, y, _) ->
     Printf.eprintf "unknown extension rule %s/%s\n" x y;
     assert false
  | _ -> assert false
;;

let to_llproof tr_expr mlp args =
  let (name, meta, con, hyp) = to_llargs tr_expr mlp.mlrule in
  let (subs, exts) = List.split (Array.to_list args) in
  let ext = List.fold_left Expr.union [] exts in
  let extras = Expr.diff ext mlp.mlconc in
  let nn = {
      Llproof.conc = List.map tr_expr (extras @@ mlp.mlconc);
      Llproof.rule = Llproof.Rextension (name, meta, con, hyp);
      Llproof.hyps = subs;
    }
  in (nn, extras)
;;

let rec pp_expr e =
  match e with
  | Evar _ -> e
  | Emeta _ -> e
  | Eapp ("Is_true", [Eapp (s, args, _)], _) ->
      eapp ("Is_true**" ^ s, List.map pp_expr args)
  | Eapp (s, args, _) -> eapp (s, List.map pp_expr args)
  | Enot (e1, _) -> enot (pp_expr e1)
  | Eand (e1, e2, _) -> eand (pp_expr e1, pp_expr e2)
  | Eor (e1, e2, _) -> eor (pp_expr e1, pp_expr e2)
  | Eimply (e1, e2, _) -> eimply (pp_expr e1, pp_expr e2)
  | Eequiv (e1, e2, _) -> eequiv (pp_expr e1, pp_expr e2)
  | Etrue -> e
  | Efalse -> e
  | Eall (v, t, e, _) -> eall (v, t, pp_expr e)
  | Eex (v, t, e, _) -> eex (v, t, pp_expr e)
  | Etau (v, t, e, _) -> etau (v, t, pp_expr e)
  | Elam (v, t, e, _) when occurs "basics.list__t" t ->
      let t1 = replace_first "basics.list__t" "List.list" t in
      elam (v, t1, pp_expr e)
  | Elam (v, t, e, _) -> elam (v, t, pp_expr e)
;;

let built_in_defs =
  let x = Expr.newvar () in
  let y = Expr.newvar () in
  let tx = Expr.newvar () in
  let ty = Expr.newvar () in
  [
    Def (DefReal ("crp", "basics.crp", [tx; ty; x; y],
                  eapp (Namespace.tuple_name, [x; y])));
    Def (DefReal ("pair", "basics.pair", [tx; ty; x; y],
                  eapp (Namespace.tuple_name, [x; y])));
    Inductive ("List.list", ["A"], [
                 ("List.nil", []);
                 ("List.cons", [Param "A"; Self]);
               ]);
  ]
;;

let preprocess l =
  let f x =
    match x with
    | Hyp (name, e, goalness) -> Hyp (name, pp_expr e, goalness)
    | Def (DefReal (name, sym, formals, body)) ->
        Def (DefReal (name, sym, formals, pp_expr body))
    | Def (DefPseudo _) -> assert false
    | Sig _ -> x
    | Inductive _ -> x
  in
  built_in_defs @ List.map f l
;;

let rec process_expr e =
  match e with
  | Evar _ -> e
  | Emeta _ -> e
  | Eapp (s, args, _) when is_prefix 0 "Is_true**" s ->
      let s1 = chop_prefix "Is_true**" s in
      eapp ("Is_true", [eapp (s1, List.map process_expr args)])
  | Eapp (s, args, _) -> eapp (s, List.map process_expr args)
  | Enot (e1, _) -> enot (process_expr e1)
  | Eand (e1, e2, _) -> eand (process_expr e1, process_expr e2)
  | Eor (e1, e2, _) -> eor (process_expr e1, process_expr e2)
  | Eimply (e1, e2, _) -> eimply (process_expr e1, process_expr e2)
  | Eequiv (e1, e2, _) -> eequiv (process_expr e1, process_expr e2)
  | Etrue -> e
  | Efalse -> e
  | Eall (e1, t, e2, _) -> eall (process_expr e1, t, process_expr e2)
  | Eex (e1, t, e2, _) -> eex (process_expr e1, t, process_expr e2)
  | Etau (e1, t, e2, _) -> etau (process_expr e1, t, process_expr e2)
  | Elam (e1, t, e2, _) -> elam (process_expr e1, t, process_expr e2)
;;

let rec process_expr_set accu l =
  match l with
  | [] -> accu
  | h::t -> process_expr_set (Expr.union [process_expr h] accu) t
;;

open Llproof;;

let rec process_prooftree p =
  let pconc = process_expr_set [] p.conc in
  let phyps = List.map process_prooftree p.hyps in
  match p.rule with
  | Rpnotp (Eapp (s1, args1, _), Enot (Eapp (s2, args2, _), _))
    when is_prefix 0 "Is_true**" s1 ->
      assert (s1 = s2);
      let s = chop_prefix "Is_true**" s1 in
      let fa1 = eapp (s, List.map process_expr args1) in
      let fa2 = eapp (s, List.map process_expr args2) in
      let step1 = {
        conc = Expr.union [enot (eapp ("=", [fa1; fa2]))] pconc;
        rule = Rnotequal (fa1, fa2);
        hyps = phyps;
      } in
      let step2 = {
        conc = pconc;
        rule = Rpnotp (eapp ("Is_true", [fa1]), enot (eapp ("Is_true", [fa2])));
        hyps = [step1];
      } in
      step2
  | Rextension ("zenon_focal_merge", _, _, _)
  | Rextension ("zenon_focal_split", _, _, _)
    -> begin match phyps with
       | [ p ] -> p
       | _ -> assert false
       end
  | r -> { conc = pconc; rule = process_rule r; hyps = phyps }

and process_rule r =
  match r with
  | Rfalse -> Rfalse
  | Rnottrue -> Rnottrue
  | Raxiom (e1) -> Raxiom (process_expr e1)
  | Rcut (e1) -> Rcut (process_expr e1)
  | Rnoteq (e1) -> Rnoteq (process_expr e1)
  | Reqsym (e1, e2) -> Reqsym (process_expr e1, process_expr e2)
  | Rnotnot (e1) -> Rnotnot (process_expr e1)
  | Rconnect (op, e1, e2) -> Rconnect (op, process_expr e1, process_expr e2)
  | Rnotconnect (op, e1, e2) ->
      Rnotconnect (op, process_expr e1, process_expr e2)
  | Rex (e1, v) -> Rex (process_expr e1, v)
  | Rall (e1, e2) -> Rall (process_expr e1, process_expr e2)
  | Rnotex (e1, e2) -> Rnotex (process_expr e1, process_expr e2)
  | Rnotall (e1, v) -> Rnotall (process_expr e1, v)
  | Rpnotp (e1, e2) -> Rpnotp (process_expr e1, process_expr e2)
  | Rnotequal (e1, e2) -> Rnotequal (process_expr e1, process_expr e2)
  | Rdefinition (n, s, e1, e2) ->
      Rdefinition (n, s, process_expr e1, process_expr e2)
  | Rextension (s, el1, el2, ell) ->
      Rextension (s, List.map process_expr el1, List.map process_expr el2,
                  List.map (List.map process_expr) ell)
  | Rlemma (_, _) -> r
;;

let process_lemma l = { l with proof = process_prooftree l.proof };;
let postprocess p = List.map process_lemma p;;

let declare_context_coq oc =
  fprintf oc "Require Import zenon_focal.\n";
  ["bool"; "Is_true"; "basics.not_b"; "basics.and_b"; "basics.or_b";
   "basics.xor_b";
   "true"; "false"; "FOCAL.ifthenelse" ;
  ]
;;

Extension.register {
  Extension.name = "focal";
  Extension.newnodes = newnodes;
  Extension.add_formula = add_formula;
  Extension.remove_formula = remove_formula;
  Extension.preprocess = preprocess;
  Extension.postprocess = postprocess;
  Extension.to_llproof = to_llproof;
  Extension.declare_context_coq = declare_context_coq;
};;
