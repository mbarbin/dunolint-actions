# lint-check

A reusable GitHub Action to run dunolint lint check on the project.

## Usage

```yaml
- uses: mbarbin/dunolint-actions/lint-check@<ref>
```

By default, the action uses config autoloading. You can optionally override the workspace root or config file:

```yaml
- uses: mbarbin/dunolint-actions/lint-check@<ref>
  with:
    workspace-root: ./path/to/workspace
    dunolint-config: ./path/to/dunolint-config-override.sexp
```

- See [`action.yml`](./action.yml) for all available options.

### Requirements

- The `dunolint` CLI must be available in the runner environment PATH.

### Permissions

The lint-check action only reads files from the repository, so it uses the default `contents: read` permission. No additional permissions are required.

### Example Workflow

```yaml
name: Lint Check

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  lint-check:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v5
      - name: Setup dunolint
        uses: mbarbin/dunolint-actions/setup-dunolint@v1
        with:
          dunolint-version: 0.0.20251006
      - name: Run lint check
        uses: mbarbin/dunolint-actions/lint-check@v1
```

### Config Files

By default, dunolint automatically discovers and loads `dunolint` config files from your workspace root and subdirectories during the linting process. This allows you to have different linting rules for different parts of your project without needing to explicitly specify config file locations.

The `dunolint-config` input is optional and only needed when you want to override the automatic config discovery. When provided, it disables config autoloading and uses only the specified config file.

### See Also

- [Config Autoloading](https://mbarbin.github.io/dunolint/docs/explanation/config/autoloading) - How dunolint automatically discovers and loads config files
- [Config Reference](https://mbarbin.github.io/dunolint/docs/reference/config/) - Complete config file syntax and options
- [Dunolint Documentation](https://mbarbin.github.io/dunolint/) - Main documentation site

## License

MIT. See [LICENSE](../LICENSE).
