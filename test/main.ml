(*********************************************************************************)
(*  dunolint-actions - Reusable GitHub Actions for the dunolint linter tool      *)
(*  SPDX-FileCopyrightText: 2024-2025 Mathieu Barbin <mathieu.barbin@gmail.com>  *)
(*  SPDX-License-Identifier: MIT                                                 *)
(*********************************************************************************)

open! Dunolint.Config.V1.Std

let skip_paths = []

let rules =
  [ `rule
      (enforce
         (dune_project
            (dune_lang_version
               (gte (Dune_project.Dune_lang_version.create (3, 20))))))
  ; `rule
      (enforce
         (dune_project (implicit_transitive_deps (equals `False))))
  ]
;;

let config = Dunolint.Config.v1 (Dunolint.Config.V1.create (skip_paths @ rules))

let () =
  print_endline (Dunolint.Config.to_file_contents config ~generated_by:"main.ml");
  ()
;;
