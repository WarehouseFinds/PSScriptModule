@{
    # PSScriptAnalyzer settings for this workspace
    Rules = @{
        'PSAvoidUsingPlainTextForPassword' = @{ Enable = $true }
        'PSAvoidUsingConvertToSecureStringWithPlainText' = @{ Enable = $true }
    }
    # Example: exclude rules that are noisy for this scaffold
    ExcludeRules = @('PSUseApprovedVerbs')
}
