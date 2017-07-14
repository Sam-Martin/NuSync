Function Publish-NSModules{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        $Modules,
        [Parameter(Mandatory=$True)]
        [string]$Path,
        [Parameter(Mandatory=$True)]
        [string]$Repository,
        [Parameter(Mandatory=$True)]
        [string]$NugetApiKey,
        $ExcludeModules
    )

    Write-Verbose "Publishing $($Modules.Length) modules to $Repository"

    $Modules = Sort-NSModuleList -ModuleList $Modules

    Foreach($Module in $Modules){
        $ModulePath = Join-Path $Path $Module.Name
        $ModulePath = Join-Path $ModulePath $Module.Version
        
        $FindModuleParams = @{
            Name = $Module.Name
            RequiredVersion = $Module.Version
            Repository = $Repository
            ErrorAction = "SilentlyContinue"
        }

        If($ExcludeModules -and $(Compare-NSModuleInList -ModuleList $ExcludeModules -ModuleToCheck $Module)){
            Write-verbose "You asked me to exclude $($Module.Name) $($Module.Version), skipping"
            Continue
        }

        If(Find-Module @FindModuleParams){
            Write-verbose "$($Module.Name) $($Module.Version) already exists in $Repository"
            Continue
        }

        Write-Verbose "Publishing $($Module.Name) $($Module.Version) to $Repository"
        Publish-Module -Path $ModulePath -Repository $Repository -NuGetApiKey $NugetApiKey
    }
}