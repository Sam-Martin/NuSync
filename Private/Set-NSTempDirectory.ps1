Function Set-NSTempDirectory{
    [CmdletBinding()]
    $TempPath = "$Env:Temp\PowerShellNS"
    if(-not (Test-Path $TempPath)){
        New-Item -Path $TempPath -ItemType Directory
    }else{
        Get-ChildItem $TempPath | Remove-Item -Force -Recurse
    }
    return $TempPath
}