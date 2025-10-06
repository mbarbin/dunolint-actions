#!/bin/sh
# SPDX-FileCopyrightText: 2025 Mathieu Barbin <mathieu.barbin@gmail.com>
# SPDX-License-Identifier: MIT
set -eu

DUNOLINT_CONFIG="${DUNOLINT_CONFIG:-}"
DUNOLINT_WORKSPACE_ROOT="${DUNOLINT_WORKSPACE_ROOT:-}"

# Build the dunolint command with optional flags
CMD="dunolint lint --check"

if [ -n "$DUNOLINT_WORKSPACE_ROOT" ]; then
  CMD="$CMD --root $DUNOLINT_WORKSPACE_ROOT"
fi

if [ -n "$DUNOLINT_CONFIG" ]; then
  CMD="$CMD --config $DUNOLINT_CONFIG"
fi

# Execute the command
eval "$CMD"
