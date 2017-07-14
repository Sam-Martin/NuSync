Function Find-NSAllModuleVersion{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Repository
    )

    Write-Verbose "Finding all versions of all modules from $Repository"

    $Modules = Find-Module -Repository $Repository
    $ModulesAllVersions = @()
    Foreach($Module in $Modules){
        $ModulesAllVersions += Find-Module -Repository $Repository -Name $Module.Name -AllVersions
    }
    Return $ModulesAllVersions
}