#PSScriptModule.Template
A production-ready PowerShell script module template designed to streamline the creation, testing, and delivery of PowerShell modules. It follows modern code quality, security, and continuous delivery best practices out of the box.
Key features include:
- A clean, standardized module structure with dedicated folders for source code, tests, and documentation
- Automated build orchestration powered by Invoke-Build
- Dependency management via PSDepend
- Static code analysis and security checks using PSScriptAnalyzer
- Comprehensive unit testing with Pester
- Automated documentation generation with PlatyPS
- Preconfigured CI/CD workflows for continuous testing and automated releases

## CI Status
[![CI](https://github.com/WarehouseFinds/PPSScriptModule.Template/actions/workflows/release.yml/badge.svg)](https://github.com/OWNER/REPO/actions/workflows/release.yml)

## Versioning
This project uses [Semantic Versioning](https://semver.org/) to manage version numbers.
Versioning is automated through the CI/CD pipeline, ensuring that each release is properly tagged and versioned according to semantic versioning principles.
The version number is defined in the module manifest file (`.psd1`) and is updated automatically during the release process based on the type of changes made (major, minor, patch).
GitVersion is used to calculate the version number based on commit history and tags.
GitVersion strategy is GithubFlow/v1. Every commit to the main branch that is merged via a pull request will increment the version number based on the type of changes included in the pull request. Every Change to the main branch that is merged via a pull request will create a new release.
In order to manually increment the version number, push a commit with a message that includes one of the following keywords:
- `+semver: breaking` or `+semver: major` for a major version bump
- `+semver: feature` or `+semver: minor` for a minor version bump
- `+semver: fix` or `+semver: patch` for a patch version bump
- `+semver: none` or `+semver: skip` to skip version bump