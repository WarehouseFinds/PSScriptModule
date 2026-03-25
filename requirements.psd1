@{
    # NOTE:
    # PSDependOptions with Target = 'CurrentUser' installs all declared module
    # dependencies into the current user's scope rather than system-wide.
    # This can impact multi-user development or shared build environments,
    # where each user/agent will get their own copy of the dependencies.
    PSDependOptions                = @{
        Target = 'CurrentUser'
    }
    'InvokeBuild'                  = @{
        'Version'    = 'latest'
        'Repository' = 'PSGallery'
    }
    'ModuleBuilder'                = @{
        'Version'    = 'latest'
        'Repository' = 'PSGallery'
    }
    'Pester'                       = @{
        'Version'    = 'latest'
        'Repository' = 'PSGallery'
    }
    'PSScriptAnalyzer'             = @{
        'Version'    = 'latest'
        'Repository' = 'PSGallery'
    }
    'InjectionHunter'              = @{
        'Version'    = 'latest'
        'Repository' = 'PSGallery'
    }
    'Microsoft.PowerShell.PlatyPS' = @{
        'Version'    = 'latest'
        'Repository' = 'PSGallery'
    }
}
