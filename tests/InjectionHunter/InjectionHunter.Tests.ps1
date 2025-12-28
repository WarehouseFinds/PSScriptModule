[CmdletBinding()]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '',
    Justification = 'Suppress false positives in Pester code blocks')]
param()

Set-StrictMode -Version Latest

Describe 'Injection Hunter security checks' {

    BeforeAll {
        $modulePath = Resolve-Path (Join-Path $PSScriptRoot '..\..\src')
        $injectionHunterPath = (Get-Module InjectionHunter -ListAvailable).Path
    }

    It 'contains no Injection Hunter violations' {
        $requestParam = @{
            Path           = $modulePath
            Recurse        = $true
            CustomRulePath = $injectionHunterPath
            Severity       = 'Warning', 'Error'
        }
        $results = Invoke-ScriptAnalyzer @requestParam | ForEach-Object {
            "Problem in $($_.ScriptName) at line $($_.Line) with message: $($_.Message)"
        }

        $results | Should -BeNullOrEmpty
    }
}
