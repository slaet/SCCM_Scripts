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
