# PSRedFishClient module

This folder contains the `PSRedFishClient` PowerShell module.


Quick start

```powershell
Import-Module ./src/PSRedFishClient
Connect-Redfish -BaseUri 'https://example-redfish.local' -Credential (Get-Credential)
Get-RedfishResource -Path '/redfish/v1'
```

Structure

- `Public/` — exported functions (each function in a separate `.ps1`)
- `Private/` — internal helpers

The module file dot-sources `Public` and `Private` at import time so functions are available as usual.

Exports

- `Connect-Redfish` — stores connection state (BaseUri, optional credential)
- `Get-RedfishResource` — simple GET wrapper around `Invoke-RestMethod`
- `Invoke-RedfishRequest` — generic REST wrapper (GET/POST/PATCH/DELETE)

Notes

- This is a scaffold. Implement authentication headers, TLS, retry/error handling as needed.
