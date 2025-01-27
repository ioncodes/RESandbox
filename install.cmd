xcopy "C:\Temp\Files\x64dbg_extract\release" "C:\Tools\x64dbg" /E /H /C /I
set desktop=%USERPROFILE%\Desktop
powershell "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%desktop%\\x64dbg.lnk'); $s.TargetPath = 'C:\\Tools\\x64dbg\\x64\\x64dbg.exe'; $s.Save()"
powershell "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%desktop%\\x32dbg.lnk'); $s.TargetPath = 'C:\\Tools\\x64dbg\\x32\\x32dbg.exe'; $s.Save()"

C:\Temp\Files\vscode.exe /verysilent /suppressmsgboxes /MERGETASKS="!runcode,desktopicon,quicklaunchicon,addcontextmenufiles,addcontextmenufolders,addtopath"

if exist "C:\Temp\Files\idafree.exe" (
    C:\Temp\Files\idafree.exe --mode unattended
    powershell "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%desktop%\\IDA Free 9.0.lnk'); $s.TargetPath = 'C:\\Program Files\\IDA Free 9.0\\ida.exe'; $s.Save()"
    xcopy "C:\Temp\Files\idafree.hexlic" "C:\Program Files\IDA Free 9.0\idafree.hexlic" /E /H /C /I
)

if exist "C:\Temp\Files\idapro.exe" (
    C:\Temp\Files\idapro.exe --mode unattended --install_python 1
    powershell "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%desktop%\\IDA Professional 9.0.lnk'); $s.TargetPath = 'C:\\Program Files\\IDA Professional 9.0\\ida.exe'; $s.Save()"
    xcopy "C:\Temp\Files\idapro.hexlic" "C:\Program Files\IDA Professional 9.0\idapro.hexlic" /E /H /C /I
)
