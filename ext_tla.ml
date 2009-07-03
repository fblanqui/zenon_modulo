(*  Copyright 2008 INRIA  *)
Version.add "$Id: ext_tla.ml,v 1.27 2009-07-03 15:52:23 doligez Exp $";;

(* Extension for TLA+ : set theory. *)
(* Symbols: TLA.in *)

open Printf;;

open Expr;;
open Misc;;
open Mlproof;;
open Node;;
open Phrase;;

let add_formula e = ();;
let remove_formula e = ();;

let tla_set_constructors = [
  "TLA.emptyset";
  "TLA.upair";
  "TLA.add";
  "TLA.set";
  "TLA.infinity";
  "TLA.SUBSET";
  "TLA.UNION";
  "TLA.INTER";
  "TLA.cup";
  "TLA.cap";
  "TLA.setminus";
  "TLA.subsetOf";
  "TLA.setOfAll";
  "TLA.FuncSet";
  "TLA.DOMAIN";
  "TLA.Product";
];;

let is_set_expr e =
  match e with
  | Evar (v, _) -> List.mem v tla_set_constructors
  | Eapp (f, _, _) -> List.mem f tla_set_constructors
  | _ -> false
;;

let tla_fcn_constructors = [
  "TLA.Fcn";
  "TLA.except";
  "TLA.oneArg";
  "TLA.extend";
];;

let is_fcn_expr e =
  match e with
  | Evar (v, _) -> List.mem v tla_fcn_constructors
  | Eapp (f, _, _) -> List.mem f tla_fcn_constructors
  | _ -> false
;;

let is_notequiv e =
  match e with
  | Eapp ("$notequiv", _, _) -> true
  | _ -> false
;;

let mkbranches hs = Array.of_list (List.map (fun x -> [x]) hs);;

let rec decompose_add e =
  match e with
  | Eapp ("TLA.add", [e1; e2], _) ->
     let (l, rest) = decompose_add e2 in (e1 :: l, rest)
  | _ -> ([], e)
;;

let newnodes_prop e g =
  let mknode prio name args branches =
    [ Node {
      nconc = [e];
      nrule = Ext ("tla", name, args);
      nprio = prio;
      ngoal = g;
      nbranches = branches;
    } ]
  in
  let mknode_cut prio name args branches =
    [ Node {
      nconc = [];
      nrule = Ext ("tla", name, args);
      nprio = prio;
      ngoal = g;
      nbranches = branches;
    } ]
  in
  let mknode_inst m term =
    match m with
    | Eall (v, t, p, _) ->
       let n = Expr.substitute [(v, term)] p in
       [ Node {
         nconc = [m];
         nrule = All (m, term);
         nprio = Inst m;
         ngoal = g;
         nbranches = [| [n] |];
       } ]
    | Eex (v, t, p, _) ->
       let n = Expr.substitute [(v, term)] (enot p) in
       let nm = enot (m) in
       [ Node {
         nconc = [nm];
         nrule = NotEx (nm, term);
         nprio = Inst m;
         ngoal = g;
         nbranches = [| [n] |];
       } ]
    | _ -> assert false
  in
  match e with
  | Eapp ("=", [e1; Etrue], _) ->
     mknode Prop "eq_x_true" [e; e1; e1] [| [e1] |]

  | Eapp ("=", [Etrue; e1], _) ->
     mknode Prop "eq_true_x" [e; e1; e1] [| [e1] |]

  | Enot (Eapp ("=", [e1; Etrue], _), _) ->
     let h1 = enot (e1) in
     mknode Prop "noteq_x_true" [e; h1; e1] [| [h1] |]

  | Enot (Eapp ("=", [Etrue; e1], _), _) ->
     let h1 = enot (e1) in
     mknode Prop "noteq_true_x" [e; h1; e1] [| [h1] |]

  | Eapp ("=", [e1; Efalse], _) ->
     let h = enot (e1) in
     mknode Prop "eq_x_false" [e; h; e1] [| [h] |]

  | Eapp ("=", [Efalse; e1], _) ->
     let h = enot (e1) in
     mknode Prop "eq_false_x" [e; h; e1] [| [h] |]

  | Emeta (e1, _) ->
     mknode_inst e1 efalse

  | Enot (Emeta (e1, _), _) ->
     mknode_inst e1 etrue

  | Eapp ("TLA.in", [e1; Evar ("TLA.emptyset", _)], _) ->
    mknode Prop "in_emptyset" [e; e1] [| |]

  | Eapp ("TLA.in", [e1; Eapp ("TLA.upair", [e2; e3], _)], _) ->
    let h1 = eapp ("=", [e1; e2]) in
    let h2 = eapp ("=", [e1; e3]) in
    mknode Prop "in_upair" [e; h1; h2; e1; e2; e3] [| [h1]; [h2] |]
  | Enot (Eapp ("TLA.in", [e1; Eapp ("TLA.upair", [e2; e3], _)], _), _) ->
    let h1 = enot (eapp ("=", [e1; e2])) in
    let h2 = enot (eapp ("=", [e1; e3])) in
    mknode Prop "notin_upair" [e; h1; h2; e1; e2; e3] [| [h1; h2] |]

  | Eapp ("TLA.in", [e1; Eapp ("TLA.add", [e2; e3], _) as s], _) ->
     let (elems, rest) = decompose_add s in
     let helems = List.map (fun x -> eapp ("=", [e1; x])) elems in
     let hs =
       if Expr.equal rest (evar "TLA.emptyset") then helems
       else helems @ [eapp ("TLA.in", [e1; rest])]
     in
     mknode Prop "in_add" [e; e1; s] (mkbranches hs)
  | Eapp ("TLA.in", [e1; Eapp ("TLA.set", elems, _) as s], _) ->
     let helems = List.map (fun x -> eapp ("=", [e1; x])) elems in
     mknode Prop "in_set" [e; e1; s] (mkbranches helems)
  | Enot (Eapp ("TLA.in", [e1; Eapp ("TLA.add", [e2; e3], _) as s], _), _) ->
     let (elems, rest) = decompose_add s in
     let helems = List.map (fun x -> enot (eapp ("=", [e1; x]))) elems in
     let hs =
       if Expr.equal rest (evar "TLA.emptyset") then helems
       else enot (eapp ("TLA.in", [e1; rest])) :: helems
     in
     mknode Prop "notin_add" [e; e1; s] [| hs |]
  | Enot (Eapp ("TLA.in", [e1; Eapp ("TLA.set", elems, _) as s], _), _) ->
     let helems = List.map (fun x -> enot (eapp ("=", [e1; x]))) elems in
     mknode Prop "notin_set" [e; e1; s] [| helems |]

  (* infinity -- needed ? *)

  | Eapp ("TLA.in", [e1; Eapp ("TLA.SUBSET", [s], _)], _) ->
     let h1 = eapp ("subseteq", [e1; s]) in
     mknode Prop "in_SUBSET" [e; h1; e1; s] [| [h1] |]
  | Enot (Eapp ("TLA.in", [e1; Eapp ("TLA.SUBSET", [s], _)], _), _) ->
     let h1 = enot (eapp ("subseteq", [e1; s])) in
     mknode Prop "notin_SUBSET" [e; h1; e1; s] [| [h1] |]

  | Eapp ("TLA.in", [e1; Eapp ("TLA.UNION", [s], _)], _) ->
     let b = Expr.newvar () in
     let h1 = eex (b, "", eand (eapp ("TLA.in", [b; s]),
                                eapp ("TLA.in", [e1; b]))) in
     mknode Prop "in_UNION" [e; h1; e1; s] [| [h1] |]
  | Enot (Eapp ("TLA.in", [e1; Eapp ("TLA.UNION", [s], _)], _), _) ->
     let b = Expr.newvar () in
     let h1 = enot (eex (b, "", eand (eapp ("TLA.in", [b; s]),
                                      eapp ("TLA.in", [e1; b])))) in
     mknode Arity "notin_UNION" [e; h1; e1; s] [| [h1] |]

  (* INTER -- needed ? *)

  | Eapp ("TLA.in", [e1; Eapp ("TLA.cup", [e2; e3], _)], _) ->
     let h1 = eapp ("TLA.in", [e1; e2]) in
     let h2 = eapp ("TLA.in", [e1; e3]) in
     mknode Prop "in_cup" [e; h1; h2; e1; e2; e3] [| [h1]; [h2] |]
  | Enot (Eapp ("TLA.in", [e1; Eapp ("TLA.cup", [e2; e3], _)], _), _) ->
     let h1 = enot (eapp ("TLA.in", [e1; e2])) in
     let h2 = enot (eapp ("TLA.in", [e1; e3])) in
     mknode Prop "notin_cup" [e; h1; h2; e1; e2; e3] [| [h1; h2] |]

  | Eapp ("TLA.in", [e1; Eapp ("TLA.cap", [e2; e3], _)], _) ->
     let h1 = eapp ("TLA.in", [e1; e2]) in
     let h2 = eapp ("TLA.in", [e1; e3]) in
     mknode Prop "in_cap" [e; h1; h2; e1; e2; e3] [| [h1; h2] |]
  | Enot (Eapp ("TLA.in", [e1; Eapp ("TLA.cap", [e2; e3], _)], _), _) ->
     let h1 = enot (eapp ("TLA.in", [e1; e2])) in
     let h2 = enot (eapp ("TLA.in", [e1; e3])) in
     mknode Prop "notin_cap" [e; h1; h2; e1; e2; e3] [| [h1]; [h2] |]

  | Eapp ("TLA.in", [e1; Eapp ("TLA.setminus", [e2; e3], _)], _) ->
     let h1 = eapp ("TLA.in", [e1; e2]) in
     let h2 = enot (eapp ("TLA.in", [e1; e3])) in
     mknode Prop "in_setminus" [e; h1; h2; e1; e2; e3] [| [h1; h2] |]
  | Enot (Eapp ("TLA.in", [e1; Eapp ("TLA.setminus", [e2; e3], _)], _), _) ->
     let h1 = enot (eapp ("TLA.in", [e1; e2])) in
     let h2 = eapp ("TLA.in", [e1; e3]) in
     mknode Prop "notin_setminus" [e; h1; h2; e1; e2; e3] [| [h1]; [h2] |]

  | Eapp ("TLA.in",
          [e1; Eapp ("TLA.subsetOf", [s; Elam (v, _, p, _) as pred], _)],
          _) ->
     let h1 = eapp ("TLA.in", [e1; s]) in
     let h2 = substitute [(v, e1)] p in
     mknode Prop "in_subsetof" [e; h1; h2; e1; s; pred] [| [h1; h2] |]
  | Enot (Eapp ("TLA.in",
                [e1; Eapp ("TLA.subsetOf", [s; Elam (v, _, p, _) as pred], _)],
                _), _) ->
     let h1 = enot (eapp ("TLA.in", [e1; s])) in
     let h2 = enot (substitute [(v, e1)] p) in
     mknode Prop "notin_subsetof" [e; h1; h2; e1; s; pred] [| [h1]; [h2] |]

  | Eapp ("TLA.in",
          [e1; Eapp ("TLA.setOfAll", [s; Elam (v, _, p, _) as pred], _)],
          _) ->
     let x = Expr.newvar () in
     let h1 = eex (x, "", eand (eapp ("TLA.in", [x; s]),
                                eapp ("=", [e1; substitute [(v, x)] p])))
     in
     mknode (Inst h1) "in_setofall" [e; h1; e1; s; pred] [| [h1] |]
  | Enot (Eapp ("TLA.in",
                [e1; Eapp ("TLA.setOfAll", [s; Elam (v, _, p, _) as pred], _)],
                _), _) ->
     let x = Expr.newvar () in
     let h1 = enot (eex (x, "", eand (eapp ("TLA.in", [x; s]),
                                      eapp ("=", [e1; substitute [(v, x)] p]))))
     in
     mknode (Inst h1) "notin_setofall" [e; h1; e1; s; pred] [| [h1] |]

  | Eapp ("TLA.in", [f; Eapp ("TLA.FuncSet", [a; b], _)], _) ->
     let h1 = eapp ("TLA.isAFcn", [f]) in
     let h2 = eapp ("=", [eapp ("TLA.DOMAIN", [f]); a]) in
     let x = Expr.newvar () in
     let h3 = eall (x, "",
                eimply (eapp ("TLA.in", [x; a]),
                        eapp ("TLA.in", [eapp ("TLA.fapply", [f; x]); b])))
     in
     mknode (Inst h3) "in_funcset" [e; h1; h2; h3; f; a; b] [| [h1; h2; h3] |]
  | Enot (Eapp ("TLA.in", [f; Eapp ("TLA.FuncSet", [a; b], _)], _), _) ->
     let h1 = enot (eapp ("TLA.isAFcn", [f])) in
     let h2 = enot (eapp ("=", [eapp ("TLA.DOMAIN", [f]); a]))
     in
     let x = Expr.newvar () in
     let h3 = enot (
               eall (x, "",
                     eimply (eapp ("TLA.in", [x; a]),
                             eapp ("TLA.in", [eapp ("TLA.fapply", [f; x]); b]))))
     in
     mknode (Inst h3) "notin_funcset" [e; h1; h2; h3; f; a; b]
            [| [h1]; [h2]; [h3] |]

  | Eapp ("=", [e1; e2], _) when is_set_expr e1 || is_set_expr e2 ->
     let x = Expr.newvar () in
     let h = eall (x, "", eequiv (eapp ("TLA.in", [x; e1]),
                                  eapp ("TLA.in", [x; e2])))
     in
     mknode (Inst h) "setequal" [e; h; e1; e2] [| [h] |]
  | Enot (Eapp ("=", [e1; e2], _), _) when is_set_expr e1 || is_set_expr e2 ->
     let x = Expr.newvar () in
     let h = enot (eall (x, "", eequiv (eapp ("TLA.in", [x; e1]),
                                        eapp ("TLA.in", [x; e2]))))
     in
     mknode (Inst h) "notsetequal" [e; h; e1; e2] [| [h] |]

  | Enot (Eapp ("TLA.isAFcn", [Eapp ("TLA.Fcn", [s; l], _)], _), _) ->
     mknode Prop "notisafcn_fcn" [e; s; l] [| |]

  | Enot (Eapp ("TLA.isAFcn", [Eapp ("TLA.except", [f; v; e1], _)], _), _) ->
     mknode Prop "notisafcn_except" [e; f; v; e1] [| |]

  | Enot (Eapp ("TLA.isAFcn", [Eapp ("TLA.oneArg", [e1; e2], _)], _), _) ->
     mknode Prop "notisafcn_onearg" [e; e1; e2] [| |]

  | Enot (Eapp ("TLA.isAFcn", [Eapp ("TLA.extend", [f; g], _)], _), _) ->
     mknode Prop "notisafcn_extend" [e; f; g] [| |]

  | Eapp ("=", [e1; e2], _) when is_fcn_expr e1 || is_fcn_expr e2 ->
     let x = Expr.newvar () in
     let h1 = eequiv (eapp ("TLA.isAFcn", [e1]), eapp ("TLA.isAFcn", [e2])) in
     let h2 = eapp ("=", [eapp ("TLA.DOMAIN", [e1]); eapp ("TLA.DOMAIN", [e2])])
     in
     let h3 = eall (x, "", eapp ("=", [eapp ("TLA.fapply", [e1; x]);
                                       eapp ("TLA.fapply", [e2; x])]))
     in
     let h = eand (eand (h1, h2), h3) in
     mknode (Inst h3) "funequal" [e; h; e1; e2] [| [h] |]
  | Enot (Eapp ("=", [e1; e2], _), _) when is_fcn_expr e1 || is_fcn_expr e2 ->
     let x = Expr.newvar () in
     let h0 = eapp ("TLA.isAFcn", [e1]) in
     let h1 = eapp ("TLA.isAFcn", [e2]) in
     let h2 = eapp ("=", [eapp ("TLA.DOMAIN", [e1]); eapp ("TLA.DOMAIN", [e2])])
     in
     let h3 = eall (x, "", eimply (eapp ("TLA.in", [x; eapp("TLA.DOMAIN",[e2])]),
                                   eapp ("=", [eapp ("TLA.fapply", [e1; x]);
                                               eapp ("TLA.fapply", [e2; x])])))
     in
     let h = enot (eand (eand (eand (h0, h1), h2), h3)) in
     mknode (Inst h3) "notfunequal" [e; h; e1; e2] [| [h] |]

  | Enot (Eapp ("=", [Etau (v1, t1, p1, _); Etau (v2, t2, p2, _)], _), _)
    when not (is_notequiv p1) && not (is_notequiv p2) ->
     let x = Expr.newvar () in
     let p1x = substitute [(v1, x)] p1 in
     let p2x = substitute [(v2, x)] p2 in
     let h = eex (x, t1, eapp ("$notequiv", [p1x; p2x])) in
     mknode Arity "choose_diff_choose"
            [e; h; elam (v1, t1, p1); elam (v2, t2, p2)] [| [h] |]

  | Eapp ("$notequiv", [e1; e2], _) ->
     let h = enot (eequiv (e1, e2)) in
     mknode Arity "notequivdef" [] [| [h] |]

  | Enot (Eapp ("=", [e1; Etau (v2, t2, p2, _)], _), _)
  | Enot (Eapp ("=", [Etau (v2, t2, p2, _); e1], _), _)
  ->
     let h1 = eex (v2, t2, p2) in
     let h2a = enot (eex (v2, t2, p2)) in
     let h2b = enot (substitute [(v2, e1)] p2) in
     mknode_cut Arity "notequalchoose" [h1; h2a; h2b; elam (v2, t2, p2); e1]
                [| [h1]; [h2a; h2b] |]

  | _ -> []
;;

let apply f e =
  match f with
  | Elam (v, _, b, _) -> Expr.substitute [(v, e)] b
  | _ -> assert false
;;

let rewrites in_expr x ctx e mknode =
  let lamctx = elam (x, "", ctx) in
  let appctx e = substitute [(x, e)] ctx in
  let mk_boolcase name e1 e2 =
    let h1a = eapp ("=", [e; etrue]) in
    let h1b = appctx (etrue) in
    let h2a = eapp ("=", [e; efalse]) in
    let h2b = appctx (efalse) in
    mknode ("boolcase_" ^ name) [appctx e; h1a; h1b; h2a; h2b; lamctx; e1; e2]
           [] [| [h1a; h1b]; [h2a; h2b] |]
  in
  match e with
  | _ when in_expr && Index.member e ->
     let h1 = appctx (etrue) in
     mknode "trueistrue" [appctx e; e; h1; lamctx; e] [e] [| [h1] |]
  | Evar (f, _) when in_expr && Index.has_def f ->
     let (d, params, body) = Index.get_def f in
     if params = [] then begin
       let unfolded = appctx body in
       mknode "definition" [appctx e; unfolded; e] [] [| [unfolded] |]
     end else
       []
  | Eapp (f, args, _) when in_expr && Index.has_def f ->
     let (d, params, body) = Index.get_def f in
     if List.length params = List.length args then begin
       let s = List.combine params args in
       let unfolded = appctx (substitute s body) in
       mknode "definition" [appctx e; unfolded; e] [] [| [unfolded] |]
     end else
       []
  | Eapp ("TLA.fapply", [Eapp ("TLA.Fcn", [s; Elam (v, _, b, _) as l], _); a], _)
  -> let h1 = enot (eapp ("TLA.in", [a; s])) in
     let h2 = appctx (Expr.substitute [(v, a)] b) in
     mknode "fapplyfcn" [appctx e; h1; h2; lamctx; s; l; a] [] [| [h1]; [h2] |]
  | Eapp ("TLA.fapply", [Eapp ("TLA.except", [f; v; e1], _); w], _) ->
     let indom = eapp ("TLA.in", [w; eapp ("TLA.DOMAIN", [f])]) in
     let h1a = indom in
     let h1b = eapp ("=", [v; w]) in
     let h1c = appctx e1 in
     let h2a = indom in
     let h2b = enot (eapp ("=", [v; w])) in
     let h2c = appctx (eapp ("TLA.fapply", [f; w])) in
     let h3 = enot indom in
     mknode "fapplyexcept" [appctx e; h1a; h1b; h1c; h2a; h2b; h2c; h3;
                            lamctx; f; v; e1; w]
            [] [| [h1a; h1b; h1c]; [h2a; h2b; h2c]; [h3] |]
(*
  | Eapp ("TLA.fapply", [f; a], _) ->
     rewrites true x (appctx (eapp ("TLA.fapply", [x; a]))) f mknode
     @ rewrites true x (appctx (eapp ("TLA.fapply", [f; x]))) a mknode
*)
  | Eapp ("TLA.DOMAIN", [Eapp ("TLA.except", [f; v; e1], _)], _) ->
     let h1 = appctx (eapp ("TLA.DOMAIN", [f])) in
     mknode "domain_except" [appctx e; h1; lamctx; f; v; e1] [] [| [h1] |]
  | Eapp ("TLA.DOMAIN", [Eapp ("TLA.Fcn", [s; l], _)], _) ->
     let h1 = appctx (s) in
     mknode "domain_fcn" [appctx e; h1; lamctx; s; l] [] [| [h1] |]
(*
  | Eapp ("TLA.DOMAIN", [f], _) ->
     rewrites true x (appctx (eapp ("TLA.DOMAIN", [x]))) f mknode
*)
  | Enot (e1, _) when in_expr ->
     let h1a = eapp ("=", [e; etrue]) in
     let h1b = appctx (etrue) in
     let h2a = eapp ("=", [e; efalse]) in
     let h2b = appctx (efalse) in
     mknode ("boolcase_not") [appctx e; h1a; h1b; h2a; h2b; lamctx; e1]
            [] [| [h1a; h1b]; [h2a; h2b] |]
  | Eand (e1, e2, _) when in_expr -> mk_boolcase "and" e1 e2
  | Eor (e1, e2, _) when in_expr -> mk_boolcase "or" e1 e2
  | Eimply (e1, e2, _) when in_expr -> mk_boolcase "imply" e1 e2
  | Eequiv (e1, e2, _) when in_expr -> mk_boolcase "equiv" e1 e2
  | Eapp ("=", [e1; e2], _) when in_expr -> mk_boolcase "equal" e1 e2
  (* FIXME missing : Eall, Eex *)

  | Eapp ("TLA.cond", [Etrue; e1; e2], _) ->
     let h1 = appctx (e1) in
     mknode "iftrue" [appctx e; h1; lamctx; e1; e2] [] [| [h1] |]
  | Eapp ("TLA.cond", [Efalse; e1; e2], _) ->
     let h1 = appctx (e2) in
     mknode "iffalse" [appctx e; h1; lamctx; e1; e2] [] [| [h1] |]
  | Eapp ("TLA.cond", [e0; e1; e2], _) ->
     let h1a = e0 in
     let h1b = appctx (e1) in
     let h2a = enot (e0) in
     let h2b = appctx (e2) in
     mknode "ifthenelse" [appctx e; h1a; h1b; h2a; h2b; lamctx; e0; e1; e2] []
            [| [h1a; h1b]; [h2a; h2b] |]
  | Etau (v, t, b, _) ->
     let h1 = eex (v, t, b) in
     let h2 = enot (h1) in
     mknode "cut" [h1] [] [| [h1]; [h2] |]
  | _ -> []
;;

let rec find_rewrites in_expr x ctx e mknode =
  let local = rewrites in_expr x ctx e mknode in
  match e with
  | _ when local <> [] -> local
  | Eapp (p, args, _) ->
     let rec loop leftarg rightarg =
       match rightarg with
       | [] -> []
       | h::t ->
          let e1 = eapp (p, List.rev_append leftarg (x :: t)) in
          let newctx = substitute [(x, e1)] ctx in
          begin match find_rewrites true x newctx h mknode with
          | [] -> loop (h::leftarg) t
          | l -> l
          end
     in
     loop [] args
  | Enot (e1, _) ->
     find_rewrites false x (substitute [(x, enot x)] ctx) e1 mknode
  | _ -> []
;;

let newnodes_rewrites e g =
  let mknode name args add_con branches =
    match name with
    | "definition" ->
       begin match args with
       | [folded; unfolded; Evar (f, _)] ->
          let (def, params, body) = Index.get_def f in
          [ Node {
            nconc = e :: add_con;
            nrule = Definition (def, folded, unfolded);
            nprio = Arity;
            ngoal = g;
            nbranches = branches;
          }]
       | [folded; unfolded; Eapp (f, args, _)] ->
          let (def, params, body) = Index.get_def f in
          [ Node {
            nconc = e :: add_con;
            nrule = Definition (def, folded, unfolded);
            nprio = Arity;
            ngoal = g;
            nbranches = branches;
          }]
       | _ -> assert false
       end
    | "cut" ->
      begin match args with
      | [h] ->
         [ Node {
           nconc = add_con;
           nrule = Cut (h);
           nprio = Arity;
           ngoal = g;
           nbranches = branches;
         }]
      | _ -> assert false
      end
    | _ ->
       [ Node {
         nconc = e :: add_con;
         nrule = Ext ("tla", name, args);
         nprio = Arity;
         ngoal = g;
         nbranches = branches;
       }]
       @ (if name = "ifthenelse" then [Stop] else [])
  in
  let x = Expr.newvar () in
  find_rewrites false x x e mknode
;;

let newnodes e g =
  newnodes_prop e g @ newnodes_rewrites e g
;;

let to_llargs r =
  let alpha r =
    match r with
    | Ext (_, name, c :: h1 :: h2 :: args) ->
       ("zenon_" ^ name, args, [c], [ [h1; h2] ])
    | _ -> assert false
  in
  let beta r =
    match r with
    | Ext (_, name, c :: h1 :: h2 :: args) ->
       ("zenon_" ^ name, args, [c], [ [h1]; [h2] ])
    | _ -> assert false
  in
  let beta2 r =
    match r with
    | Ext (_, name, c :: h1a :: h1b :: h2a :: h2b :: args) ->
       ("zenon_" ^ name, args, [c], [ [h1a; h1b]; [h2a; h2b] ])
    | _ -> assert false
  in
  let single r =
    match r with
    | Ext (_, name, c :: h :: args) -> ("zenon_" ^ name, args, [c], [ [h] ])
    | _ -> assert false
  in
  let close r =
    match r with
    | Ext (_, name, c :: args) -> ("zenon_" ^ name, args, [c], [])
    | _ -> assert false
  in
  match r with
  | Ext (_, "in_emptyset", [c; e1]) -> ("zenon_in_emptyset", [e1], [c], [])
  | Ext (_, "in_upair", _) -> beta r
  | Ext (_, "notin_upair", _) -> alpha r
  | Ext (_, "in_cup", _) -> beta r
  | Ext (_, "notin_cup", _) -> alpha r
  | Ext (_, "in_cap", _) -> alpha r
  | Ext (_, "notin_cap", _) -> beta r
  | Ext (_, "in_setminus", _) -> alpha r
  | Ext (_, "notin_setminus", _) -> beta r
  | Ext (_, "in_subsetof", _) -> alpha r
  | Ext (_, "notin_subsetof", _) -> beta r
  | Ext (_, "in_funcset", [c; h1; h2; h3; f; a; b]) ->
     ("zenon_in_funcset", [f; a; b], [c], [ [h1; h2; h3] ])
  | Ext (_, "notin_funcset", [c; h1; h2; h3; f; a; b]) ->
     ("zenon_notin_funcset", [f; a; b], [c], [ [h1]; [h2]; [h3] ])
  | Ext (_, "trueistrue", [c1; c2; h1; ctx; e1]) ->
     ("zenon_trueistrue", [ctx; e1], [c1; c2], [ [h1] ])
  | Ext (_, "fapplyfcn", _) -> beta r
  | Ext (_, "fapplyexcept", [c; h1a; h1b; h1c; h2a; h2b; h2c; h3;
                             ctx; f; v; e1; w]) ->
     ("zenon_fapplyexcept", [ctx; f; v; e1; w], [c],
      [ [h1a; h1b; h1c]; [h2a; h2b; h2c]; [h3] ])
  | Ext (_, "boolcase_not", _) -> beta2 r
  | Ext (_, "boolcase_and", _) -> beta2 r
  | Ext (_, "boolcase_or", _) -> beta2 r
  | Ext (_, "boolcase_imply", _) -> beta2 r
  | Ext (_, "boolcase_equiv", _) -> beta2 r
  | Ext (_, "notisafcn_fcn", _) -> close r
  | Ext (_, "notisafcn_except", _) -> close r
  | Ext (_, "notisafcn_onearg", _) -> close r
  | Ext (_, "notisafcn_extend", _) -> close r
  | Ext (_, "ifthenelse", _) -> beta2 r
  | Ext (_, name, _) -> single r
  | _ -> assert false
;;

let is_simple r =
  match r with
  | Ext (_, "in_add", _) -> false
  | Ext (_, "notin_add", _) -> false
  | _ -> true
;;

let to_llproof tr_expr mlp args =
  match mlp.mlrule with
  | Ext (_, "in_add", [c; x; s]) ->
     let subexts = Array.to_list args in
     let tre = tr_expr in
     let trl l = List.map tr_expr l in
     let rec mkproof s subexts myconc =
       match s, subexts with
       | Evar ("TLA.emptyset", _), _ ->
         let tconc = tre (eapp ("TLA.in", [x; s])) in
         let n0 = {
           Llproof.conc = trl myconc;
           Llproof.rule = Llproof.Rextension ("zenon_in_emptyset",
                                              [tre x], [tconc], []);
           Llproof.hyps = [];
         } in
         (n0, [])
       | Eapp ("TLA.add", [y; s1], _), ((sub, ext) :: t) ->
          let concl = eapp ("TLA.in", [x; s]) in
          let h1 = eapp ("=", [x; y]) in
          let h2 = eapp ("TLA.in", [x; s1]) in
          let (sub1, ext1) = mkproof s1 t (h2 :: myconc) in
          let extras = Expr.diff (Expr.union ext ext1) myconc in
          let n0 = {
            Llproof.conc = trl (extras @@ myconc);
            Llproof.rule = Llproof.Rextension ("zenon_in_add",
                                               trl [x; y; s1], [tre concl],
                                               [ [tre h1]; [tre h2] ]);
            Llproof.hyps = [sub; sub1];
          } in
          (n0, extras)
        | _, [subext] -> subext
        | _ -> assert false
     in
     mkproof s subexts mlp.mlconc
  | Ext (_, "in_set", [c; x; s]) ->
     let subexts = Array.to_list args in
     let tre = tr_expr in
     let trl l = List.map tr_expr l in
     let rec mkproof s subexts myconc =
       match s, subexts with
       | Eapp ("TLA.set", [], _), [] ->
         let tconc = tre (eapp ("TLA.in", [x; s])) in
         let n0 = {
           Llproof.conc = trl myconc;
           Llproof.rule = Llproof.Rextension ("zenon_in_emptyset",
                                              [tre x], [tconc], []);
           Llproof.hyps = [];
         } in
         (n0, [])
       | Eapp ("TLA.set", y :: l1, _), ((sub, ext) :: t) ->
          let s1 = eapp ("TLA.set", l1) in
          let concl = eapp ("TLA.in", [x; s]) in
          let h1 = eapp ("=", [x; y]) in
          let h2 = eapp ("TLA.in", [x; s1]) in
          let (sub1, ext1) = mkproof s1 t (h2 :: myconc) in
          let extras = Expr.diff (Expr.union ext ext1) myconc in
          let n0 = {
            Llproof.conc = trl (extras @@ myconc);
            Llproof.rule = Llproof.Rextension ("zenon_in_add",
                                               trl [x; y; s1], [tre concl],
                                               [ [tre h1]; [tre h2] ]);
            Llproof.hyps = [sub; sub1];
          } in
          (n0, extras)
        | _ -> assert false
     in
     mkproof s subexts mlp.mlconc
  | Ext (_, "notin_add", [c; x; s]) ->
     let (sub, ext) =
       match args with
       | [| (sub, ext) |] -> (sub, ext)
       | _ -> assert false
     in
     let tre = tr_expr in
     let trl l = List.map tr_expr l in
     let rec mkproof s myconc =
       match s with
       | Eapp ("TLA.add", [y; s1], _) ->
          let concl = enot (eapp ("TLA.in", [x; s])) in
          let h1 = enot (eapp ("=", [x; y])) in
          let h2 = enot (eapp ("TLA.in", [x; s1])) in
          let (sub1, ext1) = mkproof s1 (h1 :: h2 :: myconc) in
          let extras = Expr.diff ext1 myconc in
          let n0 = {
            Llproof.conc = trl (extras @@ myconc);
            Llproof.rule = Llproof.Rextension ("zenon_notin_add",
                                               trl [x; y; s1], [tre concl],
                                               [ trl [h1; h2] ]);
            Llproof.hyps = [sub1];
          } in
          (n0, extras)
       | _ -> (sub, ext)
     in
     mkproof s mlp.mlconc
  | Ext (_, "notin_set", [c; x; s]) ->
     let (sub, ext) =
       match args with
       | [| (sub, ext) |] -> (sub, ext)
       | _ -> assert false
     in
     let tre = tr_expr in
     let trl l = List.map tr_expr l in
     let rec mkproof s myconc =
       match s with
       | Eapp ("TLA.set", y :: l1, _) ->
          let s1 = eapp ("TLA.set", l1) in
          let concl = enot (eapp ("TLA.in", [x; s])) in
          let h1 = enot (eapp ("=", [x; y])) in
          let h2 = enot (eapp ("TLA.in", [x; s1])) in
          let (sub1, ext1) = mkproof s1 (h1 :: h2 :: myconc) in
          let extras = Expr.diff ext1 myconc in
          let n0 = {
            Llproof.conc = trl (extras @@ myconc);
            Llproof.rule = Llproof.Rextension ("zenon_notin_add",
                                               trl [x; y; s1], [tre concl],
                                               [ trl [h1; h2] ]);
            Llproof.hyps = [sub1];
          } in
          (n0, extras)
       | _ -> (sub, ext)
     in
     mkproof s mlp.mlconc
  | Ext (_, "notequivdef", _) ->
     begin match args with
     | [| a |] -> a
     | _ -> assert false
     end

  | Ext (_, "notequalchoose", [h1; h2a; h2b; p; e1]) ->
     let (sub1, ext1, sub2, ext2) =
       match args with
       | [| (sub1, ext1); (sub2, ext2) |] -> (sub1, ext1, sub2, ext2)
       | _ -> assert false
     in
     let ext2x = Expr.diff ext2 [h2a] in
     let extras = Expr.diff (Expr.union ext1 ext2x) mlp.mlconc in
     let nh2a = match h2a with Enot (e1, _) -> e1 | _ -> assert false in
     let n0 = {
       Llproof.conc = List.map tr_expr ([h2a] @@ mlp.mlconc @@ ext2x);
       Llproof.rule = Llproof.Rnotex (tr_expr nh2a, tr_expr e1);
       Llproof.hyps = [sub2];
     } in
     let n1 = {
       Llproof.conc = List.map tr_expr (extras @@ mlp.mlconc);
       Llproof.rule = Llproof.Rcut (tr_expr h1);
       Llproof.hyps = [sub1; n0];
     }
     in (n1, extras)

  | _ ->
     let (name, meta, con, hyps) = to_llargs mlp.mlrule in
     let tmeta = List.map tr_expr meta in
     let tcon = List.map tr_expr con in
     let thyps = List.map (List.map tr_expr) hyps in
     let (subs, exts) = List.split (Array.to_list args) in
     let ext = List.fold_left Expr.union [] exts in
     let extras = Expr.diff ext mlp.mlconc in
     let nn = {
         Llproof.conc = List.map tr_expr (extras @@ mlp.mlconc);
         Llproof.rule = Llproof.Rextension (name, tmeta, tcon, thyps);
         Llproof.hyps = subs;
       }
     in (nn, extras)
;;

let preprocess l = l;;

let add_phrase p = ();;

let rec pp_expr e =
  match e with
  | Evar _ -> e
  | Emeta _ -> assert false
  | Eapp ("$notequiv", [e1; e2], _) -> enot (eequiv (pp_expr e1, pp_expr e2))
  | Eapp ("$notequiv", _, _) -> assert false
  | Eapp (s, args, _) -> eapp (s, List.map pp_expr args)
  | Enot (e1, _) -> enot (pp_expr e1)
  | Eand (e1, e2, _) -> eand (pp_expr e1, pp_expr e2)
  | Eor (e1, e2, _) -> eor (pp_expr e1, pp_expr e2)
  | Eimply (e1, e2, _) -> eimply (pp_expr e1, pp_expr e2)
  | Eequiv (e1, e2, _) -> eequiv (pp_expr e1, pp_expr e2)
  | Etrue | Efalse -> e
  | Eall (v, t, e1, _) -> eall (pp_expr v, t, pp_expr e1)
  | Eex (v, t, e1, _) -> eex (pp_expr v, t, pp_expr e1)
  | Etau (v, t, e1, _) -> etau (pp_expr v, t, pp_expr e1)
  | Elam (v, t, e1, _) -> elam (pp_expr v, t, pp_expr e1)
;;

module LL = Llproof;;

let pp_rule r =
  match r with
  | LL.Rfalse | LL.Rnottrue -> r
  | LL.Raxiom (e) -> LL.Raxiom (pp_expr e)
  | LL.Rcut (e) -> LL.Rcut (pp_expr e)
  | LL.Rnoteq (e) -> LL.Rnoteq (pp_expr e)
  | LL.Reqsym (e1, e2) -> LL.Reqsym (pp_expr e1, pp_expr e2)
  | LL.Rnotnot (e) -> LL.Rnotnot (pp_expr e)
  | LL.Rconnect (op, e1, e2) -> LL.Rconnect (op, pp_expr e1, pp_expr e2)
  | LL.Rnotconnect (op, e1, e2) -> LL.Rnotconnect (op, pp_expr e1, pp_expr e2)
  | LL.Rex (e1, e2) -> LL.Rex (pp_expr e1, pp_expr e2)
  | LL.Rall (e1, e2) -> LL.Rall (pp_expr e1, pp_expr e2)
  | LL.Rnotex (e1, e2) -> LL.Rnotex (pp_expr e1, pp_expr e2)
  | LL.Rnotall (e1, e2) -> LL.Rnotall (pp_expr e1, pp_expr e2)
  | LL.Rpnotp (e1, e2) -> LL.Rpnotp (pp_expr e1, pp_expr e2)
  | LL.Rnotequal (e1, e2) -> LL.Rnotequal (pp_expr e1, pp_expr e2)
  | LL.Rcongruence (e1, e2, e3) ->
     LL.Rcongruence (pp_expr e1, pp_expr e2, pp_expr e3)
  | LL.Rdefinition (nm, id, e1, e2) ->
     LL.Rdefinition (nm, id, pp_expr e1, pp_expr e2)
  | LL.Rextension (n, a, cs, hss) ->
     LL.Rextension (n, List.map pp_expr a, List.map pp_expr cs,
                 List.map (List.map pp_expr) hss)
  | LL.Rlemma (n, args) -> LL.Rlemma (n, List.map pp_expr args)
;;

let rec pp_prooftree t = {
  LL.conc = List.map pp_expr t.LL.conc;
  LL.rule = pp_rule t.LL.rule;
  LL.hyps = List.map pp_prooftree t.LL.hyps;
};;

let pp_lemma l = {
  LL.name = l.LL.name;
  LL.params = List.map (fun (n, t, e) -> (n, t, pp_expr e)) l.LL.params;
  LL.proof = pp_prooftree l.LL.proof;
};;

let postprocess p = List.map pp_lemma p;;

let declare_context_coq oc = [];;

Extension.register {
  Extension.name = "tla";
  Extension.newnodes = newnodes;
  Extension.add_formula = add_formula;
  Extension.remove_formula = remove_formula;
  Extension.preprocess = preprocess;
  Extension.add_phrase = add_phrase;
  Extension.postprocess = postprocess;
  Extension.to_llproof = to_llproof;
  Extension.declare_context_coq = declare_context_coq;
};;
