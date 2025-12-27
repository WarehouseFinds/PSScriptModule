# Generate Pester Unit tests for the module
BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Get-PSScriptModuleInfo Tests" {
    It "Should return module info for existing module" {
        $moduleInfo = Get-PSScriptModuleInfo -ModuleName "PSReadLine"
        $moduleInfo | Should -Not -Be $null
        $moduleInfo.Name | Should -Be "PSReadLine"
    }

    It "Should throw an error for non-existing module" {
        { Get-PSScriptModuleInfo -ModuleName "NonExistingModule" } | Should -Throw
    }
}