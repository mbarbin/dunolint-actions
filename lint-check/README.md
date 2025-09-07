# lint-check

A reusable GitHub Action to run dunolint lint check on the project.

## Usage

```yaml
- uses: mbarbin/dunolint-actions/lint-check@<ref>
  with:
    dunolint-config: .dunolint-config.sexp
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
          dunolint-version: 0.0.20250907
      - name: Run lint check
        uses: mbarbin/dunolint-actions/lint-check@v1
        with:
          dunolint-config: .dunolint-config.sexp
```

### Config File

If no config is provided, dunolint uses a default configuration that enforces basic linting rules such as formatting and alphabetic sorting of certain components. For custom linting rules, you can provide your own config file.

You can find the config reference manual [here](https://mbarbin.github.io/dunolint/docs/reference/config/). For more details about dunolint, see the [dunolint documentation](https://mbarbin.github.io/dunolint/).

## License

MIT. See [LICENSE](../LICENSE).
