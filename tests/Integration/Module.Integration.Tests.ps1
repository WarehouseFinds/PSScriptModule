[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '', Justification = 'Variables used in Pester test contexts')]
param()

BeforeAll {
    # Determine the built module path dynamically
    $moduleName = 'PSScriptModule'
    $modulePath = Resolve-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath '../../build/out' -ChildPath $moduleName)
    $manifestPath = Join-Path -Path $modulePath -ChildPath "$moduleName.psd1"

    # Import the built module
    if ($manifestPath -and (Test-Path $manifestPath)) {
        Import-Module $manifestPath -Force -ErrorAction Stop
    } else {
        throw "Built module not found at: $manifestPath. Run 'Invoke-Build' first."
    }
}

AfterAll {
    # Clean up
    Remove-Module 'PSScriptModule' -ErrorAction SilentlyContinue
}

Describe 'PSScriptModule Integration Tests' -Tag 'Integration' {

    Context 'Module Loading' {
        It 'Should load the module successfully' {
            $module = Get-Module -Name 'PSScriptModule'
            $module | Should -Not -BeNullOrEmpty
        }

        It 'Should have module manifest or psm1' {
            $module = Get-Module -Name 'PSScriptModule'
            $module.Path | Should -Match '\.(psd1|psm1)$'
        }

        It 'Should have correct module name' {
            $module = Get-Module -Name 'PSScriptModule'
            $module.Name | Should -Be 'PSScriptModule'
        }

        It 'Should have a valid version' {
            $module = Get-Module -Name 'PSScriptModule'
            $module.Version | Should -Not -BeNullOrEmpty
            $module.Version | Should -BeOfType [version]
        }
    }

    Context 'Exported Functions' {
        BeforeAll {
            $module = Get-Module -Name 'PSScriptModule'
            $exportedCommands = $module.ExportedCommands.Keys

            # Discover public functions from source
            $publicFunctionsPath = Resolve-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath '../../src/Public')
            if ($publicFunctionsPath -and (Test-Path $publicFunctionsPath)) {
                $publicFunctionFiles = Get-ChildItem -Path $publicFunctionsPath -Include '*.ps1' -Exclude '*.Tests.ps1' -Recurse |
                Select-Object -ExpandProperty BaseName
            }
        }

        It 'Should export at least one function' {
            $exportedCommands.Count | Should -BeGreaterThan 0
        }

        It 'Should discover public functions from src/Public' {
            $publicFunctionFiles.Count | Should -BeGreaterThan 0 -Because 'src/Public should contain at least one public function'
        }

        It 'Should export all public functions from src/Public' {
            foreach ($functionName in $publicFunctionFiles) {
                $exportedCommands | Should -Contain $functionName -Because "Public function $functionName should be exported"
            }
        }

        It 'Should not export private functions' {
            $privateFunctionsPath = Join-Path $PSScriptRoot '../../src/Private'
            if (Test-Path $privateFunctionsPath) {
                $privateFiles = Get-ChildItem -Path $privateFunctionsPath -Filter '*.ps1' -Exclude '*.Tests.ps1' |
                Select-Object -ExpandProperty BaseName

                foreach ($functionName in $privateFiles) {
                    $exportedCommands | Should -Not -Contain $functionName -Because "Private function $functionName should not be exported"
                }
            }
        }

        It 'Should have help for all exported functions' {
            foreach ($command in $exportedCommands) {
                $help = Get-Help $command
                $help.Synopsis | Should -Not -BeNullOrEmpty -Because "Function $command should have synopsis"
                $help.Description | Should -Not -BeNullOrEmpty -Because "Function $command should have description"
            }
        }

        It 'Should have help for each public function dynamically' {
            foreach ($functionName in $publicFunctionFiles) {
                $help = Get-Help $functionName
                $help.Synopsis | Should -Not -BeNullOrEmpty -Because "Public function $functionName should have synopsis"
            }
        }
    }

    Context 'Module Metadata' {
        BeforeAll {
            $module = Get-Module -Name 'PSScriptModule'
        }

        It 'Should have an author' {
            $module.Author | Should -Not -BeNullOrEmpty
        }

        It 'Should have a description' {
            $module.Description | Should -Not -BeNullOrEmpty
        }

        It 'Should have a company name' {
            $module.CompanyName | Should -Not -BeNullOrEmpty
        }

        It 'Should have a copyright' {
            $module.Copyright | Should -Not -BeNullOrEmpty
        }

        It 'Should specify PowerShell version' {
            $module = Get-Module -Name 'PSScriptModule'
            # PowerShellVersion may not be set for all modules
            if ($module.PowerShellVersion) {
                $module.PowerShellVersion | Should -BeOfType [version]
            } else {
                Set-ItResult -Skipped -Because 'PowerShellVersion not specified in manifest'
            }
        }

        It 'Should have project URI' {
            $module.ProjectUri | Should -Not -BeNullOrEmpty
            $module.ProjectUri.AbsoluteUri | Should -Match '^https?://'
        }

        It 'Should have license URI' {
            $module.LicenseUri | Should -Not -BeNullOrEmpty
            $module.LicenseUri.AbsoluteUri | Should -Match '^https?://'
        }
    }

    Context 'Performance' {
        It 'Should load module in reasonable time' {
            $loadTime = Measure-Command {
                Remove-Module 'PSScriptModule' -ErrorAction SilentlyContinue
                # Use the same module path resolution as BeforeAll
                Import-Module $manifestPath -Force
            }

            $loadTime.TotalSeconds | Should -BeLessThan 5 -Because 'Module should load within 5 seconds'
        }
    }
}
