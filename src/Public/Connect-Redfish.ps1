function Connect-Redfish {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$BaseUri,
        [Parameter()][pscredential]$Credential
    )

    # Module files are dot-sourced into the module scope, so script: scope is the module scope
    $script:RedfishBaseUri = $BaseUri.TrimEnd('/')
    if ($Credential) { $script:RedfishCredential = $Credential }
    return @{ Connected = $true; BaseUri = $script:RedfishBaseUri }
}
