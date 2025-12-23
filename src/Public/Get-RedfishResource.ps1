function Get-RedfishResource {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Path
    )

    if (-not $script:RedfishBaseUri) { throw 'Not connected. Call Connect-Redfish first.' }

    $uri = "$($script:RedfishBaseUri)/$($Path.TrimStart('/'))"
    $response = Invoke-RestMethod -Uri $uri -Method Get -ErrorAction Stop
    return $response
}
