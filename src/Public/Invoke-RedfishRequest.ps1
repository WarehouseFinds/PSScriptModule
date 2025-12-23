function Invoke-RedfishRequest {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidateSet('Get','Post','Patch','Put','Delete')][string]$Method,
        [Parameter(Mandatory)][string]$Path,
        [Parameter()][object]$Body
    )

    if (-not $script:RedfishBaseUri) { throw 'Not connected. Call Connect-Redfish first.' }

    $uri = "$($script:RedfishBaseUri)/$($Path.TrimStart('/'))"
    $params = @{ Uri = $uri; Method = $Method; ErrorAction = 'Stop' }
    if ($Body) { $params.Body = ($Body | ConvertTo-Json -Depth 10) ; $params.ContentType = 'application/json' }
    $response = Invoke-RestMethod @params
    return $response
}
