# NuSync [![Build status](https://ci.appveyor.com/api/projects/status/epyk14bccann3838/branch/master?svg=true)](https://ci.appveyor.com/project/Sam-Martin/nusync/branch/master)

PowerShell module to copy the contents of one PowerShell NuGet repository to another

# Example
```
$SourceRepository = "DevGallery"
$DestinationRepository = "TestGallery"
$NugetApiKey = "xxxxxxx-xxx-xxx-xxx-xxxxxxxxxxxx"

Import-Module .\NuSync.psd1
Sync-NSModule -SourceRepository $SourceRepository -DestinationRepository $DestinationRepository -NugetApiKey $NugetApiKey -Verbose
```
