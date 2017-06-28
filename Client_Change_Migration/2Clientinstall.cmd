%windir%\CCMSETUP\CCMSetup.exe /uninstall 
timeout /t 30
%windir%\temp\<SiteCode>client\CCMSetup.exe /source:%windir%\temp\<SiteCode>client SMSMP=<FQDN Server> SMSSITECODE=<Site Code> FSP=<FQDN Server> CCMLOGMAXSIZE=10000000
