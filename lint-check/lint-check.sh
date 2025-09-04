#!/bin/sh
# SPDX-FileCopyrightText: 2025 Mathieu Barbin <mathieu.barbin@gmail.com>
# SPDX-License-Identifier: MIT
set -eu

DUNOLINT_CONFIG="${DUNOLINT_CONFIG:-}"
DUNOLINT_DIRECTORY="${DUNOLINT_DIRECTORY:-.}"

# Resolve config path relative to original working directory if provided.
if [ -n "$DUNOLINT_CONFIG" ]; then
  # Convert to absolute path if it's relative, before changing directory.
  case "$DUNOLINT_CONFIG" in
    /*) CONFIG_PATH="$DUNOLINT_CONFIG" ;;
    *) CONFIG_PATH="$(pwd)/$DUNOLINT_CONFIG" ;;
  esac
fi

# Change to the specified directory.
cd "$DUNOLINT_DIRECTORY"

if [ -n "$DUNOLINT_CONFIG" ]; then
  dunolint lint --check --config "$CONFIG_PATH"
else
  dunolint lint --check
fi
