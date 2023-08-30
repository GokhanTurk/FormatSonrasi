if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "Winutil needs to be run as Administrator. Attempting to relaunch."
    Start-Process -Verb runas -FilePath powershell.exe -ArgumentList "iwr -useb https://raw.githubusercontent.com/GokhanTurk/FormatSonrasi/main/FormatSonrasi.ps1 | iex"
    break
}
Write-Host "Checking if Winget is Installed..."
if (Test-Path ~\AppData\Local\Microsoft\WindowsApps\winget.exe) {
    Write-Host "Winget Already Installed"
}
else {
    irm https://raw.githubusercontent.com/GokhanTurk/FormatSonrasi.bat/main/SilentWinget.ps1 | iex
}
function Change-Registry {
    [CmdletBinding()] Param([string]$registryPath, [string]$registryName, [string]$registryValue)
    # Check if registry value exists
    if (!(Test-Path $registryPath) -or !(Get-Item -Path $registryPath).GetValue($registryName) -ne $null) {
        New-ItemProperty -Path $registryPath -Name $registryName -Type DWord -Value $registryValue -ErrorAction SilentlyContinue
    }

    # Set registry value
    Set-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue
}
Enable-ComputerRestore -Drive "C:"
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -registryName 'ShowTaskViewButton' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -registryName 'ShowCortanaButton' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -registryName 'ShowCortanaButton' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -registryName 'SearchboxTaskbarMode' -registryValue 1
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds' -registryName 'ShellFeedsTaskbarViewMode' -registryValue 2
Change-Registry -registryPath 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -registryName '{20D04FE0-3AEA-1069-A2D8-08002B30309D}' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -registryName '{59031a47-3f72-44a7-89c5-5595fe6b30ee}' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu' -registryName '{59031a47-3f72-44a7-89c5-5595fe6b30ee}' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -registryName 'LaunchTo' -registryValue 1
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -registryName 'HideFileExt' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -registryName 'HideSCAMeetNow' -registryValue 1
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys' -registryName 'Flags' -registryValue '506'
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys' -registryName 'Flags' -registryValue '58'
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response' -registryName 'Flags' -registryValue '122'
Change-Registry -registryPath 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -registryName 'Allow Telemetry' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft' -registryName 'LetAppsRunInBackground' -registryValue 0
Change-Registry -registryPath 'Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -registryName 'GlobalUserDisabled' -registryValue 1
Change-Registry -registryPath 'Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard' -registryName 'InitialKeyboardIndicators' -registryValue 2

powercfg.exe /change monitor-timeout-ac 0
powercfg.exe /change standby-timeout-ac 0
Set-Service -Name "dot3svc" -StartupType Automatic
Set-Service -Name "WlanSvc" -StartupType Automatic
taskkill /f /im explorer.exe
start explorer.exe
winget install winget --accept-source-agreements --accept-package-agreements
winget install --id=Zoom.Zoom -e -h --scope machine --accept-source-agreements --accept-package-agreements
winget install --id=Microsoft.Teams -e -h --scope machine
winget install --id=Google.Chrome -e -h
winget install --id=RARLab.WinRAR -e -h
winget install --id=VideoLAN.VLC -e -h
winget install --id=Oracle.JavaRuntimeEnvironment -e -h
winget install --id=Adobe.Acrobat.Reader.64-bit -e -h
winget uninstall Microsoft.SkypeApp_kzf8qxf38zg5c -h
winget uninstall Microsoft.XboxApp_8wekyb3d8bbwe -h
winget uninstall Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe -h
winget uninstall Microsoft.MixedReality.Portal_8wekyb3d8bbwe -h
winget uninstall SpotifyAB.SpotifyMusic_zpdnekdrzrea0 -h
winget uninstall Microsoft.YourPhone_8wekyb3d8bbwe -h
winget uninstall Microsoft.549981C3F5F10_8wekyb3d8bbwe -h
winget uninstall Microsoft.XboxGameOverlay_8wekyb3d8bbwe -h
winget uninstall Microsoft.Xbox.TCUI_8wekyb3d8bbwe -h
winget uninstall Microsoft.BingFinance_8wekyb3d8bbwe -h
winget uninstall Microsoft.BingSports_8wekyb3d8bbwe -h
winget uninstall Microsoft.People_8wekyb3d8bbwe -h
winget uninstall Disney.37853FC22B2CE_6rarf9sa4v8jt -h
winget uninstall Microsoft.GetHelp_8wekyb3d8bbwe -h
winget uninstall Microsoft.Getstarted_8wekyb3d8bbwe -h
winget uninstall Microsoft.Wallet_8wekyb3d8bbwe -h
winget uninstall Microsoft.Office.OneNote_8wekyb3d8bbwe -h
winget uninstall Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe -h
winget uninstall Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe -h
irm https://raw.githubusercontent.com/GokhanTurk/CreateShortcut.ps1/Multiple2/shortcut.ps1 | iex
cd "C:\Users\Public\Desktop\"
Remove-Item vlc* -ErrorAction SilentlyContinue
Remove-Item Adob* -ErrorAction SilentlyContinue
cd "$env:userprofile\Desktop\"
Remove-Item "Microsoft Edge.lnk" -ErrorAction SilentlyContinue
pause
exit
