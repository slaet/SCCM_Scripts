<#

.SYNOPSIS

    Check the installed Language on a Win10 Client

.DESCRIPTION

    This script is to use in a TS for OSD to check the language on a client to get this nin variables to use it later
    for installing the right Language Pack and set the right Settings after a Win10 Serviceng update on a TS

.PARAMETER 

    NONE

.EXAMPLE

    powershell.exe -ExecutionPolicy Bypass -getLanguage.ps1

.NOTES

    Script name: getLanguage.ps1

    Version:     1.0

    Author:      Mirko Colemberg // baseVISION AG

    DateCreated: 2018-03-28

#>


$tsenv = New-Object -ComObject Microsoft.SMS.TSEnvironment
$cultureInfo = Get-UICulture
$setLanguage = switch ($cultureInfo.LCID)
{
    '1031' {"de_UI.xml"}
    '1033' {"en_UI.xml"}
    '1036' {"fr_UI.xml"}
    '1040' {"it_UI.xml"}
    Default {"de_UI.xml"}
}
$tsenv.Value("OSLang") = $setLanguage
