# install.ps1 — 安装 AHK 脚本到开机启动
# 功能：
#   1. 创建开机启动快捷方式，指向本仓库的 vi-arrows.ahk
#   2. 卸载时删除快捷方式即可
#
# 使用方法：
#   powershell -ExecutionPolicy Bypass -File install.ps1

$ErrorActionPreference = "Stop"

$AhkDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$AhkScript = Join-Path $AhkDir "vi-arrows.ahk"
$StartupDir = [Environment]::GetFolderPath("Startup")
$ShortcutPath = Join-Path $StartupDir "vi-arrows.lnk"

# 自动检测 AutoHotKey v2 安装路径（支持系统安装和用户安装）
$AhkPaths = @(
    "C:\Program Files\AutoHotkey\v2\AutoHotkey.exe"
    "$env:LOCALAPPDATA\Programs\AutoHotkey\v2\AutoHotkey64.exe"
    "$env:LOCALAPPDATA\Programs\AutoHotkey\v2\AutoHotkey32.exe"
)

$AhkExe = $null
foreach ($path in $AhkPaths) {
    if (Test-Path $path) {
        $AhkExe = $path
        break
    }
}

if (-not $AhkExe) {
    Write-Host "[.] AutoHotKey v2 not found, installing via winget..."
    Write-Host ""
    winget install AutoHotkey.AutoHotkey --source winget --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[!] winget install failed. Try manual install: https://www.autohotkey.com/"
        Write-Host "  Then re-run this script."
        exit 1
    }
    # Re-detect after install
    foreach ($path in $AhkPaths) {
        if (Test-Path $path) {
            $AhkExe = $path
            break
        }
    }
    if (-not $AhkExe) {
        Write-Host "[!] AutoHotKey was installed but the executable was not found."
        Write-Host "  Please re-run this script after installation."
        exit 1
    }
    Write-Host "[OK] AutoHotKey v2 installed successfully!"
    Write-Host ""
}

# 检测脚本是否存在
if (-not (Test-Path $AhkScript)) {
    Write-Host "[!] AHK 脚本不存在：$AhkScript"
    exit 1
}

# 创建快捷方式
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $AhkExe
$Shortcut.Arguments = "`"$AhkScript`""
$Shortcut.WorkingDirectory = $AhkDir
$Shortcut.Description = "vi-arrows - Alt+I/J/K/L global arrow keys"
$Shortcut.Save()

Write-Host "[OK] startup shortcut created:"
Write-Host "     $ShortcutPath"
Write-Host ""
Write-Host "    AHK exe: $AhkExe"
Write-Host "    Script:  $AhkScript"
Write-Host ""
Write-Host "Launch now? (y/n)"
$choice = (Read-Host).ToLower()
if ($choice -eq 'y') {
    Start-Process -FilePath $AhkExe -ArgumentList "`"$AhkScript`""
    Write-Host "[OK] vi-arrows.ahk started! Look for the AutoHotKey icon in system tray."
}

Write-Host ""
Write-Host "To uninstall, delete: $ShortcutPath"
