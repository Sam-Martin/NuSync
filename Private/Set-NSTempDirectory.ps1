Function Set-NSTempDirectory{
    [cmdletbinding(SupportsShouldProcess)]
    Param(
        $TempPath = "$Env:Temp\PowerShellNS"
    )
    
    if ($PSCmdlet.ShouldProcess($TempPath)) { 
        if(-not (Test-Path $TempPath)){
            New-Item -Path $TempPath -ItemType Directory
        }else{
            Get-ChildItem $TempPath | Remove-Item -Force -Recurse
        }
        return $TempPath
    }
}