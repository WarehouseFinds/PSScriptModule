# Generate Pester Unit tests for the module
BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "GetModuleId Tests" {
    It "Should return module ID for existing module" {
        $moduleId = GetModuleId -ModulePath (Join-Path -Path $PSScriptRoot -ChildPath "../PSScriptModule.psd1")
        $moduleId | Should -Not -Be $null
        $moduleId | Should -BeOfType [string]
    }

    It "Should throw an error for non-existing module" {
        { GetModuleId -ModulePath "NonExistingModule" } | Should -Throw
    }
}