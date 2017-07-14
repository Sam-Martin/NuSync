# NuSync
PowerShell module to copy the contents of one PowerShell NuGet repository to another

# Example
```
$SourceRepository = "DevGallery"
$DestinationRepository = "TestGallery"
$NugetApiKey = "xxxxxxx-xxx-xxx-xxx-xxxxxxxxxxxx"

Import-Module .\NuSync.psm1
Sync-SinkModules -SourceRepository $SourceRepository -DestinationRepository $DestinationRepository -NugetApiKey $NugetApiKey -Verbose
```
