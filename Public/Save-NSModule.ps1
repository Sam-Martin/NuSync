Function Save-NSModule{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        $Modules,
        [Parameter(Mandatory=$True)]
        [string]$Repository,
        [Parameter(Mandatory=$True)]
        [string]$Path,
        $ExcludeModules
    )

    Write-Verbose "Saving $($Modules.Length) from $Repository"
    
    Foreach($Module in $Modules){
        
        If($ExcludeModules -and $(Compare-NSModuleInList -ModuleList $ExcludeModules -ModuleToCheck $Module)){
            Write-verbose "You asked me to exclude $($Module.Name) $($Module.Version), skipping"
            Continue
        }
        
        Write-Verbose "Saving $($Module.Name) $($Module.Version) to $Path"
        Save-Module -Name $Module.Name -RequiredVersion $Module.Version -Path $Path -Repository $SourceRepository
    }
}
