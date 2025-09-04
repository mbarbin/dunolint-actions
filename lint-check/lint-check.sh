#!/bin/sh
# SPDX-FileCopyrightText: 2025 Mathieu Barbin <mathieu.barbin@gmail.com>
# SPDX-License-Identifier: MIT
set -eu

DUNOLINT_CONFIG="${DUNOLINT_CONFIG:-}"

if [ -n "$DUNOLINT_CONFIG" ]; then
  dunolint lint --check --config "$DUNOLINT_CONFIG"
else
  dunolint lint --check
fi
