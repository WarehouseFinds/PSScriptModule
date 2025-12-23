# Architecture overview

- Module: `PSRedFishClient` (located in `src/PSRedFishClient`)
- Purpose: provide small, composable helpers to interact with Redfish REST endpoints (connect, GET, generic requests)
- Dataflow: user calls `Connect-Redfish` to set `BaseUri` (stored in module-scoped variables), then calls `Get-RedfishResource` / `Invoke-RedfishRequest` which use `Invoke-RestMethod` to communicate with the API.
- Integration points: any tooling that can import the module and call the exported functions (scripts, CI tasks, other modules).

Notes on extension

- Add authentication handlers (Token-based oAuth or session tokens) in the connect function
- Implement configurable retry and logging in `Invoke-RedfishRequest`
- Consider adding `Invoke-WebRequest` fallback for binary responses
