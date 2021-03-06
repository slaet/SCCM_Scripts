<#
.SYNOPSIS
    Download antimalware definition update files
.DESCRIPTION
    Based on: How to manually download the latest antimalware definition updates for
    Microsoft Forefront Client Security, Microsoft Forefront Endpoint
    Protection 2010 and Microsoft System Center 2012 Endpoint Protection
    KB: http://support.microsoft.com/kb/935934/en
.PARAMETER 
    NONE
.EXAMPLE
    powershell.exe -ExecutionPolicy Bypass -file "downloadscepupdates.ps1"
.NOTES
    Script name: downloadscepupdates.ps1
    Version:     1.2
    Author:      André Picker
    DateCreated: 2014-07-22
    LastUpdate:  2017-02-27
    Change Author: Mirko Colemberg
    Change: Add command to delete old Files, older than 3 Days
    #>

##################################################################################
# Define the target path
##################################################################################
$pathx86 = "D:\ScheduledTasks\SCEPupdates\x86\"
$pathx64 = "D:\ScheduledTasks\SCEPupdates\x64\"


$wc = New-Object System.Net.WebClient

##################################################################################
# Proxy-Settings
##################################################################################
$wc.Proxy = [System.Net.WebRequest]::DefaultWebProxy
$wc.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials


# x64 ############################################################################

# Antimalware full definitions
$source = "http://go.microsoft.com/fwlink/?LinkID=87341"
$destination = $pathx64 + 'mpam-fe.exe'
$wc.DownloadFile($source, $destination) 

# Antimalware delta definitions
$source = "http://go.microsoft.com/fwlink/?LinkId=211054"
$destination = $pathx64 + 'mpam-d.exe'
$wc.DownloadFile($source, $destination)

# Network-based exploit definitions
$source = "http://go.microsoft.com/fwlink/?LinkId=197094"
$destination = $pathx64 + 'nis_full.exe'
$wc.DownloadFile($source, $destination)

# delete Files older than 3 Days
Get-ChildItem -Path $pathx64 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt (Get-Date).AddDays(-3) } | Remove-Item -Force


# x86 ############################################################################

# Antimalware full definitions
$source = "http://go.microsoft.com/fwlink/?LinkID=87342"
$destination = $pathx86 + 'mpam-fe.exe'
$wc.DownloadFile($source, $destination)

# Antimalware delta definitions
$source = "http://go.microsoft.com/fwlink/?LinkId=211053"
$destination = $pathx86 + 'mpam-d.exe'
$wc.DownloadFile($source, $destination)

# Network-based exploit definitions
$source = "http://go.microsoft.com/fwlink/?LinkId=197095"
$destination = $pathx86 + 'nis_full.exe'
$wc.DownloadFile($source, $destination)

# delete Files older than 3 Days
Get-ChildItem -Path $pathx86 -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt (Get-Date).AddDays(-3) } | Remove-Item -Force
