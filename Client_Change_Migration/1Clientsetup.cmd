xcopy %~dp0\client  %windir%\temp\<SiteCode>client /S /E /C /I /Y
cmd.exe /C %windir%\temp\<SiteCode>client\<SiteCode>Clientinstall.cmd
