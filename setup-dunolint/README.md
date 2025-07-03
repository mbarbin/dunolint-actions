# setup-dunolint

A reusable GitHub Action to download and install the [dunolint](https://github.com/mbarbin/dunolint) linter tool from a GitHub release.

## Usage

```yaml
- uses: mbarbin/dunolint-actions/setup-dunolint@<ref>
  with:
    dunolint-version: 0.0.20250403
```

- The `dunolint-version` input is required and must match a published release of dunolint.
- The action will install the `dunolint` binary and add it to the `PATH` for subsequent steps.

### Compatibility Note

The `dunolint-version` input is **mandatory** and upgrading it is the responsibility of the user. Upgrades should be done carefully. We recommend making the version change in a separate pull request, and in that PR, you can add verify that everything works as expected.

## Features

- Downloads the correct binary for the runner OS and architecture.
- Verifies the build attestation (if `gh` CLI is available).
- Installs to a temporary directory and updates the `PATH`.

## License

See [LICENSE](../LICENSE).
