Function Compare-NSModuleInList{
    Param(
        [Parameter(Mandatory=$True)]
        $ModuleList,
        [Parameter(Mandatory=$True)]
        $ModuleToCheck
    )

    Write-Verbose "Checking if $($ModuleToCheck.Name) $($ModuleToCheck.Version) exists in an array of $($ModuleList.Length) modules"

    $Modules = $ModuleList | Select-Object Name, Version
    $Module = $ModuleToCheck | Select-Object Name, Version
    if($Modules | ForEach-Object{$_.name -eq $Module.name -and $_.version -eq $Module.Version} | Where-Object {$_ -ne $false}){
        return $True
    }else{
        return $false
    }
}