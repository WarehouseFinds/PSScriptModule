function Get-PSScriptModuleInfo {
    <#
.SYNOPSIS
    Retrieves information from a PowerShell script module manifest file.

.DESCRIPTION
    The Get-PSScriptModuleInfo function reads a PowerShell script module manifest file (.psd1)
    and extracts key information such as ModuleVersion, GUID, Author, Description, and CompanyName.

.PARAMETER ModulePath
    The file path to the PowerShell script module manifest (.psd1) from which to retrieve information.

.EXAMPLE
    Get-PSScriptModuleInfo -ModulePath "C:\Modules\MyModule\MyModule.psd1"
    Retrieves module information from the specified module manifest file.

.NOTES
    This function requires PowerShell 5.0 or later.
    Ensure the module manifest file exists and is accessible.
    Errors during import will be caught and reported.
    The function returns a custom object with module information.

.LINK
    https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/import-powershelldatafile

#>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ModulePath
    )

    try {
        $moduleManifest = Import-PowerShellDataFile -Path $ModulePath
        $moduleInfo = [PSCustomObject]@{
            ModuleVersion = $moduleManifest.ModuleVersion
            GUID          = $moduleManifest.GUID
            Author        = $moduleManifest.Author
            Description   = $moduleManifest.Description
            CompanyName   = $moduleManifest.CompanyName
        }

        return $moduleInfo
    }
    catch {
        throw "$($MyInvocation.MyCommand.Name): Failed to get module info from $ModulePath. $_"
    }
}