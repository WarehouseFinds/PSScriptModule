# Generate Pester Unit tests for the module
[CmdletBinding()]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '',
    Justification = 'Suppress false positives in Pester code blocks')]
param(
)

BeforeDiscovery {
    $modulePath = Resolve-Path (Join-Path $PSScriptRoot '..\..\src')
    $files = Get-ChildItem -Path $modulePath -Recurse -Include '*.ps*1' -Exclude '*.Tests.*'
}

Describe "'<_>' Function Analysis with PSScriptAnalyzer" -ForEach $files {
    BeforeAll {
        $functionName = $_.BaseName
        $functionPath = $_
    }

    Context 'Standard Rules' {
        # Define PSScriptAnalyzer rules
        $scriptAnalyzerRules = Get-ScriptAnalyzerRule # Just getting all default rules

        # Perform analysis against each rule
        $scriptAnalyzerRules | ForEach-Object {
            It "should pass '<Rule>' rule" -TestCases @{ Rule = $_ } {
                Invoke-ScriptAnalyzer -Path $functionPath -IncludeRule $Rule | Should -BeNullOrEmpty
            }
        }
    }
}