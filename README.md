# dunolint-actions

Reusable GitHub Actions for the [dunolint](https://github.com/mbarbin/dunolint) linter tool.

[![CI](https://github.com/mbarbin/dunolint-actions/actions/workflows/ci.yml/badge.svg)](https://github.com/mbarbin/dunolint-actions/actions/workflows/ci.yml)
[![Test](https://github.com/mbarbin/dunolint-actions/actions/workflows/test-setup-dunolint.yml/badge.svg)](https://github.com/mbarbin/dunolint-actions/actions/workflows/test-setup-dunolint.yml)
[![Release](https://github.com/mbarbin/dunolint-actions/actions/workflows/create-release-on-tag.yml/badge.svg)](https://github.com/mbarbin/dunolint-actions/actions/workflows/create-release-on-tag.yml)

## Actions

- [`setup-dunolint`](./setup-dunolint/README.md): Install the dunolint executable for use in workflows.
- [`lint-check`](./lint-check/README.md): Run dunolint lint check on the project.

## Compatibility

| Action Version     | CLI dunolint Version | Status | Note                |
|:------------------:|:--------------------:|:------:|:--------------------|
| v1.0.0-alpha.3     | 0.0.20251006         | ✅     | latest, recommended |
| <= v1.0.0-alpha.2  | >= 0.0.20251006      | 🔴     | not supported       |
| v1.0.0-alpha.2     | 0.0.20250907         | 🟢     | supported           |
| v1.0.0-alpha.2     | 0.0.20250804         | 🟢     | supported           |

_This table will be updated as new versions are released._

## Usage, Documentation, Links & Resources

- See each action's `README` or `action.yml` for detailed usage and options.
- The documentation of the [dunolint](https://mbarbin.github.io/dunolint/) linter tool.
