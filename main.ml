(*  Copyright 1997 INRIA  *)
Version.add "$Id: main.ml,v 1.6 2004-05-19 13:24:44 doligez Exp $";;

open Printf;;
open Globals;;

type proof_level =
  | Proof_none
  | Proof_h of int
  | Proof_m
  | Proof_l
  | Proof_coq
;;
let proof_level = ref Proof_none;;

type input_format =
  | I_zenon
  | I_focal
  | I_tptp
;;
let input_format = ref I_zenon;;

let int_arg r arg =
  let l = String.length arg in
  let multiplier m =
    let arg1 = String.sub arg 0 (l-1) in
    r := m *. (float_of_string arg1)
  in
  if l = 0 then raise (Arg.Bad "bad numeric argument")
  else
    try
      match arg.[l-1] with
      | 'k' -> multiplier 1_000.
      | 'M' -> multiplier 1_000_000.
      | 'G' -> multiplier 1_000_000_000.
      | 's' -> multiplier 1.
      | 'm' -> multiplier 60.
      | 'h' -> multiplier 3600.
      | 'd' -> multiplier 86400.
      | '0'..'9' -> r := float_of_string arg
      | _ -> raise (Arg.Bad "bad numeric argument")
    with Failure "float_of_string" -> raise (Arg.Bad "bad numeric argument")
;;

let short_version () =
  printf "zenon version %s\n" Version.full;
  exit 0;
;;

let cvs_version () =
  printf "zenon version %s\n" Version.full;
  Version.print_cvs stdout;
  exit 0;
;;

let argspec = [
  "-d", Arg.Unit (fun () -> Globals.debug_count := 1),
      "        debug mode";
  "-iz", Arg.Unit (fun () -> input_format := I_zenon),
      "        read input file in zenon format (default)";
  "-ifocal", Arg.Unit (fun () -> input_format := I_focal),
          "    read input file in focal format";
  "-itptp", Arg.Unit (fun () -> input_format := I_tptp),
         "     read input file in TPTP format";
  "-max-size", Arg.String (int_arg size_limit),
             "<s>[kMG]  limit heap size to <s> kilo/mega/giga words"
             ^ " (default 100M)";
  "-max-time", Arg.String (int_arg time_limit),
             "<t>[smhd] limit CPU time to <t> second/minute/hour/day"
             ^ " (default 5m)";
  "-ocoq", Arg.Unit (fun () -> proof_level := Proof_coq),
         "     print the proof in Coq format";
  "-oh", Arg.Int (fun n -> proof_level := Proof_h n),
       "<n>    print the proof in high-level format up to depth <n>";
  "-ol", Arg.Unit (fun () -> proof_level := Proof_l),
       "       print the proof in low-level format";
  "-om", Arg.Unit (fun () -> proof_level := Proof_m),
       "       print the proof in middle-level format";
  "-onone", Arg.Unit (fun () -> proof_level := Proof_none),
          "    do not print the proof (default)";
  "-p0", Arg.Unit (fun () -> progress_level := Progress_none),
       "       turn off progress bar and progress messages";
  "-p1", Arg.Unit (fun () -> progress_level := Progress_bar),
       "       turn on progress bar (default)";
  "-p2", Arg.Unit (fun () -> progress_level := Progress_messages),
       "       turn on progress messages";
  "-q", Arg.Set quiet_flag,
      "        suppress proof-found/no-proof output";
  "-s", Arg.Set stats_flag,
      "        print statistics";
  "-v", Arg.Unit short_version,
      "        print version string and exit";
  "-versions", Arg.Unit cvs_version,
             " print CVS version strings and exit";
  "-w", Arg.Clear warnings_flag,
      "        suppress warnings";
  "-x", Arg.String Extension.activate,
      " <ext>  activate extension <ext>"
];;

let files = ref [];;
let add_file s = files := s :: !files;;

let umsg = "Usage: zenon [options]";;

Arg.parse argspec add_file umsg;;


let parse_string s =
  let lexbuf = Lexing.from_string s in
  Parser.theory Lexer.token lexbuf
;;
let parse_string_list l = List.flatten (List.map parse_string l);;

let parse_file f =
  try
    let chan = open_in f in
    let lexbuf = Lexing.from_channel chan in
    match !input_format with
    | I_tptp ->
        let tpphrases = Parser.tpfile Lexer.tptoken lexbuf in
        close_in chan;
        Tptp.translate (Filename.dirname f) tpphrases
    | I_focal ->
        let result = Parser.coqfile Lexer.coqtoken lexbuf in
        close_in chan;
        result
    | I_zenon ->
        Globals.goal_found := false;
        let result = Parser.theory Lexer.token lexbuf in
        close_in chan;
        if (not !Globals.goal_found) && !Globals.warnings_flag then begin
          eprintf "Warning: no goal given.\n";
          flush stderr;
        end;
        result
  with
  | Sys_error (msg) -> eprintf "%s\n" msg; exit 2
;;

Gc.set {(Gc.get ()) with
        Gc.minor_heap_size = 1_000_000;
        Gc.major_heap_increment = 1_000_000;
       }
;;

let main () =
  let phrases = List.flatten (List.map parse_file !files) in
  let retcode = ref 0 in
  begin try
    let (defs, hyps) = Phrase.separate phrases in
    if !debug_count > 0 then begin
      let ph_defs = List.map (fun x -> Phrase.Def x) defs in
      let ph_hyps = List.map (fun (x, y) -> Phrase.Hyp (x, y)) hyps in
      printf "initial formulas:\n";
      List.iter Print.phrase (ph_defs @ ph_hyps);
      printf "----\n";
      flush stdout;
      Gc.set {(Gc.get ()) with Gc.verbose = 0x010};
    end;
    let proof = Prove.prove defs hyps in
    if not !quiet_flag then begin
      printf "(* PROOF-FOUND *)\n";
      flush stdout;
    end;
    if !proof_level <> Proof_none then begin
      printf "(* BEGIN-PROOF *)\n";
      begin match !proof_level with
      | Proof_none -> assert false;
      | Proof_h n -> Print.hlproof n proof;
      | Proof_m -> Print.mlproof proof;
      | Proof_l -> Print.llproof (Mltoll.translate proof);
      | Proof_coq -> assert false; (* FIXME TODO *)
      end;
      printf "(* END-PROOF *)\n";
    end;
  with Prove.NoProof ->
    retcode := 10;
    if not !quiet_flag then printf "(* NO-PROOF *)\n";
  end;
  if !stats_flag then begin
    eprintf "nodes searched: %d\n" !Globals.inferences;
    eprintf "max branch formulas: %d\n" !Globals.top_num_forms;
    eprintf "proof nodes created: %d\n" !Globals.proof_nodes;
    eprintf "formulas created: %d\n" !Globals.num_expr;
    eprintf "\n";
    Gc.print_stat stderr;
  end;
  exit !retcode;
;;

try main () with x -> flush stdout; raise x;;