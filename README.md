# PSScriptModule - PowerShell Script Module Template

A production-ready PowerShell script module template designed to streamline the creation, testing, and delivery of enterprise-grade PowerShell modules. This template implements modern DevOps practices,
automated quality gates, and continuous delivery workflows right out of the box.

[![CI](https://github.com/WarehouseFinds/PSScriptModule/actions/workflows/ci.yml/badge.svg)](https://github.com/WarehouseFinds/PSScriptModule/actions/workflows/ci.yml)
[![Code Coverage](https://img.shields.io/github/actions/workflow/status/WarehouseFinds/PSScriptModule/ci.yml?branch=main&label=code%20coverage)](https://github.com/WarehouseFinds/PSScriptModule/actions/workflows/ci.yml)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/PSScriptModule.svg)](https://www.powershellgallery.com/packages/PSScriptModule)
[![Downloads](https://img.shields.io/powershellgallery/dt/PSScriptModule.svg)](https://www.powershellgallery.com/packages/PSScriptModule)
[![License](https://img.shields.io/github/license/WarehouseFinds/PSScriptModule)](LICENSE)

## 🎯 Purpose

This template solves the common challenge of setting up a professional PowerShell module project from scratch. Instead of manually configuring build scripts, testing frameworks, and CI/CD pipelines,
you can clone this repository and start writing your module's business logic immediately.

**Perfect for:**

- 📦 Open-source PowerShell projects
- 🔧 DevOps automation tools
- 🎓 Learning PowerShell module development best practices

## 🎬 How to Use This Template

1. Click the "Use PowerShell Module Template" button below or use GitHub's "Use this template" button
1. Fill in your module name and description
1. Wait **about 20 seconds** for the automated bootstrap workflow to complete
1. **Refresh the page** to see your customized repository

The bootstrap process will:

- Rename all files and references from `PSScriptModule` to your module name
- Update the module manifest with your description
- Remove template-specific files
- Initialize your module's structure

[![](https://img.shields.io/badge/Use%20Powershell%20Template-%E2%86%92-1f883d?style=for-the-badge&logo=github&labelColor=197935)](https://github.com/new?template_owner=WarehouseFinds&template_name=PSScriptModule&owner=%40me&name=MyProject&description=PS%20Module%20Template&visibility=public)


## � What You Get Out of the Box

When you create a module from this template, you immediately have:

✅ **CI/CD Ready**

- GitHub Actions workflows for CI, release, and publishing
- Dependency management and caching
- Code quality gates that must pass before merging
- GitHub release and changelog generation based on merged PRs

✅ **Development Environment**

- VS Code workspace configuration
- Build tasks pre-configured
- Devcontainer support for consistent environments

✅ **Version Management**

- GitVersion for semantic versioning
- GitHub Flow (v1) release workflow
- Commit-based version bumps with `+semver:` keywords
- Automated module manifest version updates

✅ **Release Management**

- GitHub Releases with changelog generation
- Automated publishing to PowerShell Gallery

✅ **Complete Testing Infrastructure**

- Pester test framework for unit tests
- Code coverage reporting
- Security scanning (PSScriptAnalyzer + InjectionHunter + CodeQL)

✅ **Project Documentation**

- Markdown-based help generation with PlatyPS
- Auto-generated external help files for `Get-Help`
- Comprehensive documentation guides in `/docs`

## 📂 Project Structure

```plaintext
PSScriptModule/
├── 📄 PSScriptModule.build.ps1      // Invoke-Build script with all build tasks
├── 📄 requirements.psd1             // PSDepend configuration for dependencies
├── 📄 gitversion.yml                // GitVersion configuration
├── 📄 CONTRIBUTING.md               // Contribution guidelines
├── 📄 AGENTS.md                     // AI agent instructions
├── 📁 src/                          // Source code
│   ├── 📄 PSScriptModule.psd1       // Module manifest
|   ├── 📁 Classes/                  // Classes definitions
│   ├── 📁 Public/                   // Public functions (exported)
│   └── 📁 Private/                  // Private functions (internal only)
├── 📁 tests/                        // Test suites
│   ├── 📁 PSScriptAnalyzer/         // Static code analysis tests
│   └── 📁 InjectionHunter/          // Security vulnerability tests
├── 📁 docs/help/                    // Markdown documentation
└── 📁 build/                        // Build output (generated)
    ├── 📁 src/                      // Copied source for building
    ├── 📁 out/                      // Compiled module output
    └── 📁 help/                     // Generated help files
```

## 🚀 Getting Started

### Prerequisites

**Required:**

- **PowerShell 7.0+**
- **Visual Studio Code** with PowerShell extension (recommended)
- **Git** for version control

*Optional* dependencies:

- **GitHub Copilot** for enhanced development experience
- **Docker or Rancher Desktop** for consistent development environments in devcontainers
- **PowerShell Gallery account** for publishing

### Quick Start

1. Click on the "Use this template" button above to create your own repository from this template.
Personalize it by updating the name, description, and visibility.

1. Clone your new repository locally:

   ```bash
   git clone https://github.com/YourUsername/YourModuleName.git
   cd YourModuleName
   ```

1. Install dependencies:

   > **Note**: If using the devcontainer (`.devcontainer/` folder), dependencies are pre-installed. Skip this step.

   ```powershell
   # Install PSDepend if not already installed
   Install-Module -Name PSDepend -Scope CurrentUser -Force
   
   # Install all project dependencies
   Invoke-PSDepend -Path ./requirements.psd1 -Install -Import -Force
   ```

1. Run Build and test tasks:

   ```powershell
   # Run default build (Clean + Build)
   Invoke-Build
   
   # Run all tests
   Invoke-Build Test
   ```

1. You are now ready to start developing your PowerShell module!

### Next Steps

After setup, customize your module:

1. **Update Module Manifest** (`src/YourModuleName.psd1`):
   - Set `Author`, `CompanyName`, `Copyright`
   - Update `Description` and `Tags`

   > **Note**: Do not change `ModuleVersion`, `RootModule` and `FunctionsToExport`  - it is managed automatically

1. **Update Documentation**:
   - Customize this README.md
   - Update [CONTRIBUTING.md](CONTRIBUTING.md) with your contribution guidelines
   - Review and update documentation in `/docs` folder

1. **Configure Publishing** (optional):
   - Register on [PowerShell Gallery](https://www.powershellgallery.com/) and create an API key
   - Add PowerShell Gallery API key in repository secrets
   - Review `.github/workflows/release.yml` for publishing settings

1. **Start Developing**:
   - Add functions to `src/Public/` (exported) or `src/Private/` (internal)
   - Create corresponding `.Tests.ps1` files

1. **Push your changes** and open a pull request to trigger CI/CD workflows


See the [documentation guides](docs/) for detailed information on:

- [Building](docs/building.md)
- [Testing](docs/testing.md)
- [Generating Help](docs/generating-help.md)
- [Publishing](docs/publishing.md)

## 🤝 Contributing

We welcome contributions! Please see our [CONTRIBUTING.md](CONTRIBUTING.md) guide for:

- How to report issues
- Pull request process
- Code style guidelines
- Testing requirements

## 📋 Dependencies

This template uses the following PowerShell modules:

| Module | Version | Purpose |
| --------- | ---------------- | --------- |
| **InvokeBuild** | 5.14.22 | Build orchestration |
| **ModuleBuilder** | 3.1.8 | Module compilation |
| **Pester** | 5.7.1 | Testing framework |
| **PSScriptAnalyzer** | 1.24.0 | Static code analysis |
| **InjectionHunter** | 1.0.0 | Security vulnerability scanning |
| **Microsoft.PowerShell.PlatyPS** | 1.0.1 | Help documentation generation |

All dependencies are managed through `requirements.psd1` and can be installed with PSDepend.

## 📝 License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

## 🎓 Learning Resources

- [PowerShell Best Practices](https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/cmdlet-development-guidelines)
- [Pester Documentation](https://pester.dev/)
- [PSScriptAnalyzer Rules](https://github.com/PowerShell/PSScriptAnalyzer)
- [Semantic Versioning](https://semver.org/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)

## 🆘 Support

- 📖 Check the [CONTRIBUTING.md](CONTRIBUTING.md) guide
- 📚 Browse the [documentation](docs/) for detailed guides
- 🐛 [Report issues](https://github.com/WarehouseFinds/PSScriptModule/issues)
- 💬 [Start a discussion](https://github.com/WarehouseFinds/PSScriptModule/discussions)

---

## 🚀 Ready to Start?

1. **[Create your module from this template →](https://github.com/new?template_owner=WarehouseFinds&template_name=PSScriptModule)**
1. **Star this repository** if you find it useful
1. **Share it** with other PowerShell developers

**Built with ❤️ by [Warehouse Finds](https://github.com/WarehouseFinds)**
