# Generate Pester Unit tests for the module
BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "Get-PSScriptModuleInfo Tests" {
    It "Should return module info for existing module" {
        $moduleInfo = Get-PSScriptModuleInfo -ModulePath (Join-Path -Path $PSScriptRoot -ChildPath "../PSScriptModule.psd1")
        $moduleInfo | Should -Not -Be $null
        $moduleInfo.GUID | Should -Be "a620849b-e411-460a-86ef-4c9e82a170ee"
    }

    It "Should throw an error for non-existing module" {
        { Get-PSScriptModuleInfo -ModulePath "NonExistingModule" } | Should -Throw
    }
}