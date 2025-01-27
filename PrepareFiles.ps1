if (-not (Get-Module -ListAvailable -Name "PowerShellGet")) {
    Install-Module -Name PowerShellGet -Force -Scope CurrentUser
}

Add-Type -AssemblyName System.IO.Compression.FileSystem

$FilesPath = "$PSScriptRoot\Files"
Get-ChildItem -Path $FilesPath | Where-Object { $_.Name -ne ".gitkeep" } | Remove-Item -Recurse -Force

# Download x64dbg
$LatestRelease = Invoke-RestMethod -Uri "https://api.github.com/repos/x64dbg/x64dbg/releases/latest" -UseBasicParsing
$DownloadUrls = $LatestRelease.assets | Where-Object { $_.name -match "snapshot_.*?\.zip$" } | Select-Object -ExpandProperty browser_download_url
$DownloadUrl = $DownloadUrls[0]

Write-Host "Downloading x64dbg from $DownloadUrl..."
$ZipFilePath = Join-Path -Path $FilesPath -ChildPath "x64dbg_latest.zip"
Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipFilePath -UseBasicParsing

[System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFilePath, "$FilesPath\x64dbg_extract")

Write-Host "x64dbg has been successfully downloaded and extracted to $FilesPath\x64dbg_extract."

# Download VS Code
$DownloadUrl = "https://update.code.visualstudio.com/latest/win32-x64-user/stable"
$ZipFilePath = Join-Path -Path $FilesPath -ChildPath "vscode.exe"
Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipFilePath -UseBasicParsing
