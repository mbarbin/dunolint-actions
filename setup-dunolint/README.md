# setup-dunolint

A reusable GitHub Action to download and install the [dunolint](https://github.com/mbarbin/dunolint) linter tool from a GitHub release.

## Usage

```yaml
- uses: mbarbin/dunolint-actions/setup-dunolint@<ref>
  with:
    dunolint-version: 0.0.20250403
```

- The `dunolint-version` input is required and must match a [published release](https://github.com/mbarbin/dunolint/releases/) of dunolint.
- The action will install the `dunolint` binary and add it to the `PATH` for subsequent steps.

## Features

- Downloads the correct binary for the runner OS and architecture.
- Verifies the binary digest (optional, see [Digest Verification](#digest-verification)).
- Verifies the build attestation (if `gh` CLI is available).
- Installs to a temporary directory and updates the `PATH`.

### Compatibility Note

The `dunolint-version` input is **mandatory** and upgrading it is the responsibility of the user. Upgrades should be done carefully. We recommend making the version change in a separate pull request, and in that PR, you can verify that everything works as expected.

The version of this action (`setup-dunolint`) is tied to the version of the `dunolint` binary it installs, because the action invokes `dunolint` with specific CLI flags and options that may change between versions.

Each version of the actions defined in this repository is tested and blessed for compatibility with specific versions of `dunolint`. The compatibility is documented as a table in the repository root `../README.md`.

### Digest Verification

You can optionally verify the integrity of the downloaded binary by providing an expected digest. If the digest does not match, the action will fail.

```yaml
- uses: mbarbin/dunolint-actions/setup-dunolint@<ref>
  with:
    dunolint-version: 0.0.20251006
    dunolint-digest: sha256:a9e6a634fae2d8b18d625e8a720c61d3c56247dd3b6e27f6464953a1b95e1c7e
```

The digest format is `algorithm:hash`, where `algorithm` is currently limited to `sha256`. GitHub automatically provides SHA256 checksums for release assets, which you can find on the [dunolint releases page](https://github.com/mbarbin/dunolint/releases/).

For a list of known SHA256 digests, see [DIGESTS.md](./DIGESTS.md).

## License

MIT. See [LICENSE](../LICENSE).
