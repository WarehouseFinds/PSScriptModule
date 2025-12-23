# Example: connect to a Redfish endpoint and get service root
$creds = Get-Credential -Message 'Redfish credentials (if required)'
Import-Module ../src/PSRedFishClient -Force
Connect-Redfish -BaseUri 'https://example-redfish.local' -Credential $creds
$root = Get-RedfishResource -Path '/redfish/v1'
$root | Format-List
