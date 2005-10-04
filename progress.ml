(*  Copyright 2005 INRIA  *)
Version.add "$Id: progress.ml,v 1.1.2.1 2005-10-03 10:22:30 doligez Exp $";;

open Printf;;

type progress = No | Bar | Msg;;
let level = ref Bar;;

let progress_cur = ref (-1);;
let progress_char = ref 0;;
let progress_anim = "/-\\|";;
let progress_bar = '*';;
let backspace = '\008';;

let do_progress f =
  match !level with
  | No -> ()
  | Bar ->
      let tm = Sys.time () in
      let cur = int_of_float (60. *. tm /. !Globals.time_limit) in
      if !progress_cur = -1 then begin
        eprintf "%s" (String.make 61 ' ');
        eprintf "%s" (String.make 60 backspace);
        progress_cur := 0;
      end;
      progress_char := (!progress_char + 1) mod (String.length progress_anim);
      if cur > !progress_cur then begin
        eprintf "%c" backspace;
        for i = !progress_cur to cur - 1 do
          eprintf "%c" progress_bar;
        done;
        eprintf "%c" (progress_anim.[!progress_char]);
        progress_cur := cur;
      end else begin
        eprintf "%c%c" backspace (progress_anim.[!progress_char]);
      end;
      flush stderr;
  | Msg ->
      flush stdout;
      flush stderr;
      f ();
      flush stdout;
      flush stderr;
;;

let end_progress msg =
  match !level with
  | No -> ()
  | Bar ->
     Printf.eprintf "\r";
     flush stderr;
  | Msg ->
     if msg <> "" then Printf.eprintf "%s\n" msg;
     flush stderr;
;;