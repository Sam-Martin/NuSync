function Sync-NSModule {
    param(
        [Parameter(Mandatory=$True)]
        [string]$SourceRepository,
        [Parameter(Mandatory=$True)]
        [string]$DestinationRepository,
        [Parameter(Mandatory=$True)]
        [string]$NugetApiKey
    )

    Write-Verbose "Syncing modules from $SourceRepository to $DestinationRepository"

    $TempDirectory = Set-NSTempDirectory
    $SourceModules = Find-NSAllModuleVersion -Repository $SourceRepository
    $DestinationModules = Find-NSAllModuleVersion -Repository $DestinationRepository
    Save-NSModule -Modules $SourceModules -Path $TempDirectory -ExcludeModules $DestinationModules -Repository $SourceRepository
    Publish-NSModule -Modules $SourceModules -Path $TempDirectory -ExcludeModules $DestinationModules -Repository $DestinationRepository -NugetApiKey $NugetApiKey
}