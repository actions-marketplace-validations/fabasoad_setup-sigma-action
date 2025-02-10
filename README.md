# Setup Sigma action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![Release](https://img.shields.io/github/v/release/fabasoad/setup-sigma-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/setup-sigma-action/actions/workflows/functional-tests.yml/badge.svg)
![linting](https://github.com/fabasoad/setup-sigma-action/actions/workflows/linting.yml/badge.svg)

This action installs [Sigma](https://github.com/SigmaHQ/sigma-cli) CLI based on
pySigma.

## Supported OS

<!-- prettier-ignore-start -->
| OS      |                    |
|---------|--------------------|
| Windows | :white_check_mark: |
| Linux   | :white_check_mark: |
| macOS   | :white_check_mark: |
<!-- prettier-ignore-end -->

## Prerequisites

None.

## Inputs

```yaml
- uses: fabasoad/setup-sigma-action@v0
  with:
    # (Optional) sigma version. Defaults to the latest version.
    version: "1.0.5"
    # (Optional) If "false" skips installation if sigma is already installed.
    # If "true" installs sigma in any case. Defaults to "false".
    force: "false"
    # (Optional) GitHub token that is used to send requests to GitHub API such
    # as getting available python versions. Defaults to the token provided by
    # GitHub Actions environment.
    github-token: "${{ github.token }}"
```

## Outputs

<!-- prettier-ignore-start -->
| Name      | Description                        | Example |
|-----------|------------------------------------|---------|
| installed | Whether sigma was installed or not | `true`  |
<!-- prettier-ignore-end -->

## Example usage

### Workflow configuration

```yaml
steps:
  - uses: actions/checkout@v4
  - uses: fabasoad/setup-sigma-action@v0
  - run: sigma version
```

### Result

```text
Run sigma version
1.0.5 (online pypi.org: 1.0.5)
```

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/80e0354a2cfcf6c9bce51834148601f246d6a850.svg "Repobeats analytics image")
