# Check if the current user has administrative privileges
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# If the current user is not an administrator, relaunch the script with administrative privileges
if (-not $isAdmin) {
    $script = (irm "https://raw.githubusercontent.com/Example/main/Example.ps1").Content
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -Command `"& {Start-Process powershell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass', '-Command', $script -Verb RunAs}`"" -Verb RunAs
}
pause
