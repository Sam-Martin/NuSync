# NuSync [![Build status](https://ci.appveyor.com/api/projects/status/epyk14bccann3838/branch/master?svg=true)](https://ci.appveyor.com/project/Sam-Martin/nusync/branch/master)

PowerShell module to copy the contents of one PowerShell NuGet repository to another
# Usage
If you have PS 5.0 or above, you can install from PowerShell Gallery using
```
Install-Module NuSync
```
Otherwise you can [download the module](https://github.com/Sam-Martin/NuSync/archive/master.zip) as a zip and re
You must have already registered the source and destination repositories that you wish to copy to and from using `Register-PSRepository`.
The names you specified when registering those repositories will be what you pass as `-SourceRepository` and `-DestinationRepository`.

Be warned that you must **not** have versions of modules in the destination repository newer than those you wish to sync from the source.  
This module works best when run as the sole module publisher for the destination as it orders the version uploads such that the oldest version will be uploaded first, and the latest last (otherwise `Publish-Module` will complain about you rewriting your version history!).  

You may wish to set `$ProgressPreference="SilentlyContinue"` when running this module because `Publish-Module`'s output becomes somewhat overwhelming during the publishing phase.
# Example
```
$SourceRepository = "DevGallery"
$DestinationRepository = "TestGallery"
$NugetApiKey = "xxxxxxx-xxx-xxx-xxx-xxxxxxxxxxxx"

Install-Module NuSync -Repository PSGallery
Import-Module NuSync
Sync-NSModule -SourceRepository $SourceRepository -DestinationRepository $DestinationRepository -NugetApiKey $NugetApiKey -Verbose
```
