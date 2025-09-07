(*********************************************************************************)
(*  dunolint-actions - Reusable GitHub Actions for the dunolint linter tool      *)
(*  SPDX-FileCopyrightText: 2024-2025 Mathieu Barbin <mathieu.barbin@gmail.com>  *)
(*  SPDX-License-Identifier: MIT                                                 *)
(*********************************************************************************)

open Dunolint.Config.V0.Std

let skip_paths = [ path (glob "_build/**") ]
let rules = []

let config =
  let skip_subtree = cond [ or_ skip_paths, skip_subtree ] in
  Dunolint.Config.v0 (Dunolint.Config.V0.create ~skip_subtree ~rules ())
;;

let () =
  print_endline (Dunolint.Config.to_file_contents config ~generated_by:"main.ml");
  ()
;;
