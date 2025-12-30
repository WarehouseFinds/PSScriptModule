# Project dependencies
@{
    Packages     = @(
        @{
            Name       = 'InvokeBuild'
            Repository = 'PSGallery'
            Type       = 'Release'
            Version    = '5.14.22'
        }
        @{
            Name       = 'ModuleBuilder'
            Repository = 'PSGallery'
            Type       = 'Release'
            Version    = '3.1.8'
        }
        @{
            Name       = 'Pester'
            Repository = 'PSGallery'
            Type       = 'Release'
            Version    = '5.7.1'
        }
        @{
            Name       = 'PSScriptAnalyzer'
            Repository = 'PSGallery'
            Type       = 'Release'
            Version    = 'latest'
        }
        @{
            Name       = 'InjectionHunter'
            Repository = 'PSGallery'
            Type       = 'Release'
            Version    = '1.0.0'
        }
        @{
            Name       = 'Microsoft.PowerShell.PlatyPS'
            Repository = 'PSGallery'
            Type       = 'Release'
            Version    = '1.0.1'
        }
    )
    Repositories = @(
        # Default PSGallery repository, installed by PowerShellGet automatically
        <# @{
            Name               = 'PSGallery'
            SourceLocation     = 'https://www.powershellgallery.com/api/v2/'
            PublishLocation    = 'https://www.powershellgallery.com/api/v2/package/'
            InstallationPolicy = 'Trusted'
        } #>
    )
}