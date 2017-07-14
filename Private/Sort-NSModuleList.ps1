Function Sort-NSModuleList{
    Param(
        [Parameter(Mandatory=$True)]
        $ModuleList
    )
    $ModuleList =  $ModuleList | Select *, 
        @{L="Major";E={($_.Version -split '\.')[0]}},
        @{L="Minor";E={($_.Version -split '\.')[1]}},
        @{L="Patch";E={($_.Version -split '\.')[2]}},
        @{L="Build";E={($_.Version -split '\.')[3]}}
    Return $ModuleList | Sort-Object Major,Minor,Patch,Build
}