# Check if the current user has administrative privileges
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# If the current user is not an administrator, relaunch the script with administrative privileges
if (-not $isAdmin) {
    Write-Warning "Yönetici olarak çalıştırmalısınız!"
    
}
# Create a function to check if a program is installed
pause
Rename-Computer qComp
pause
function Check-Program {
    param(
        [string]$ProgramName
    )
    if (Get-Command -Name $ProgramName -ErrorAction SilentlyContinue) {
        return $true
    }
    else {
        return $false
    }
}

# Create an array of programs to install
$programs = @(
    "Zoom.Zoom",
    "Google.Chrome",
    "VideoLAN.VLC",
    "RARLab.WinRAR",
    "Oracle.JavaRuntimeEnvironment",
    "Adobe.Acrobat.Reader.64-bit"
)

# Loop through the array of programs and install each one if it's not already installed
foreach ($program in $programs) {
    if (!(Check-Program -ProgramName $program)) {
        # Install the program using Chocolatey
        winget install $program -h --accept-source-agreements --accept-package-agreements
    }
}

# Set the default web browser to Chrome
$chrome = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
$currentDefaultBrowser = (Get-ItemProperty -Path 'HKLM:\Software\Classes\http\shell\open\command').'(default)'
if ($currentDefaultBrowser -ne $chrome) {
    Set-ItemProperty -Path 'HKLM:\Software\Classes\http\shell\open\command' -Name '(default)' -Value $chrome
}

# Set the default media player to VLC
$vlc = "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"
$currentDefaultPlayer = (Get-ItemProperty -Path 'HKLM:\Software\Classes\Applications\vlc.exe\shell\open\command').'(default)'
if ($currentDefaultPlayer -ne $vlc) {
    Set-ItemProperty -Path 'HKLM:\Software\Classes\Applications\vlc.exe\shell\open\command' -Name '(default)' -Value $vlc
}

# Set the default image editor to Paint.NET
$paintDotNet = "C:\Program Files\paint.net\PaintDotNet.exe"
$currentDefaultEditor = (Get-ItemProperty -Path 'HKLM:\Software\Classes\Applications\paintdotnet.exe\shell\open\command').'(default)'
if ($currentDefaultEditor -ne $paintDotNet) {
    Set-ItemProperty -Path 'HKLM:\Software\Classes\Applications\paintdotnet.exe\shell\open\command' -Name '(default)' -Value $paintDotNet
}
