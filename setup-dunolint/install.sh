#!/bin/sh
# SPDX-FileCopyrightText: 2025 Mathieu Barbin <mathieu.barbin@gmail.com>
# SPDX-License-Identifier: MIT
set -eu

if [ -z "${DUNOLINT_VERSION:-}" ]; then
  echo "Error: DUNOLINT_VERSION environment variable must be set to a specific version (e.g., 0.0.20250403)." >&2
  exit 1
fi

BINARY="dunolint"
REPO="mbarbin/dunolint"
VERSION="${DUNOLINT_VERSION}"
DIGEST="${DUNOLINT_DIGEST:-}"
TMPDIR="${RUNNER_TEMP:-/tmp}"
INSTALL_DIR="${TMPDIR}/install/bin"
mkdir -p "${INSTALL_DIR}"

os=$(echo "${RUNNER_OS:-$(uname -s)}" | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)
bin_name="${BINARY}-${VERSION}-${os}-${arch}"
url="https://github.com/${REPO}/releases/download/${VERSION}/${bin_name}"

bin_path="${INSTALL_DIR}/${bin_name}"

echo "::group::Installing ${BINARY} https://github.com/${REPO}"
if command -v curl >/dev/null 2>&1; then
  curl -sSLf -o "${bin_path}" "$url"
elif command -v wget >/dev/null 2>&1; then
  wget -q -O "${bin_path}" "$url"
else
  echo "Error: curl or wget is required to download the ${BINARY} binary." >&2
  exit 1
fi
echo "::endgroup::"

if [ -n "${DIGEST:-}" ]; then
  echo "::group::Verifying binary digest"
  algorithm="${DIGEST%%:*}"
  expected_hash="${DIGEST#*:}"
  case "${algorithm}" in
    sha256)
      if command -v sha256sum >/dev/null 2>&1; then
        actual_hash=$(sha256sum "${bin_path}" | cut -d ' ' -f 1)
      elif command -v shasum >/dev/null 2>&1; then
        actual_hash=$(shasum -a 256 "${bin_path}" | cut -d ' ' -f 1)
      else
        echo "::error title=Missing tool::sha256sum or shasum is required to verify the binary digest"
        exit 1
      fi
      ;;
    *)
      echo "::error title=Unsupported algorithm::Digest algorithm '${algorithm}' is not supported. Supported: sha256"
      exit 1
      ;;
  esac
  if [ "${actual_hash}" != "${expected_hash}" ]; then
    echo "::error title=Digest mismatch::${algorithm}: expected ${expected_hash} but got ${actual_hash} for ${bin_name}"
    exit 1
  fi
  echo "Digest verified: ${algorithm}:${actual_hash}"
  echo "::endgroup::"
fi

echo "::group::Verifying build attestation for ${bin_name}"
if command -v gh >/dev/null 2>&1; then
  if [ -z "${GH_TOKEN:-}" ]; then
    echo "::warning::GH_TOKEN environment variable is not set. Skipping attestation verification."
  else
    GH_TOKEN="${GH_TOKEN}" gh attestation verify "${bin_path}" --owner mbarbin --signer-repo "${REPO}"
  fi
else
  echo "::warning::gh CLI not found, skipping attestation verification."
fi
echo "::endgroup::"

chmod +x "${bin_path}"
mv "${bin_path}" "${INSTALL_DIR}/${BINARY}"
echo "${INSTALL_DIR}" >> "$GITHUB_PATH"

echo "::group::${BINARY} --version"
"${INSTALL_DIR}/${BINARY}" --version
echo "::endgroup::"
