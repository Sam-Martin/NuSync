function Sync-NSModules {
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
    $SourceModules = Find-NSAllModuleVersions -Repository $SourceRepository
    $DestinationModules = Find-NSAllModuleVersions -Repository $DestinationRepository
    Save-NSModules -Modules $SourceModules -Path $TempDirectory -ExcludeModules $DestinationModules -Repository $SourceRepository
    Publish-NSModules -Modules $SourceModules -Path $TempDirectory -ExcludeModules $DestinationModules -Repository $DestinationRepository -NugetApiKey $NugetApiKey
}