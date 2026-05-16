# AutoHotKey Config

系统全局的键盘映射方案，使用 AutoHotKey v2 实现 `Alt+I/J/K/L` → 方向键。

## 功能

| 快捷键 | 映射 | 效果 |
|--------|------|------|
| `Alt+I` | `↑` (Up) | 光标上移 / 上一条历史命令 |
| `Alt+K` | `↓` (Down) | 光标下移 / 下一条历史命令 |
| `Alt+J` | `←` (Left) | 光标左移 |
| `Alt+L` | `→` (Right) | 光标右移 |
| `Shift+Alt+I` | `Shift+↑` | 向上选中文本 |
| `Shift+Alt+K` | `Shift+↓` | 向下选中文本 |
| `Shift+Alt+J` | `Shift+←` | 向左选中文本 |
| `Shift+Alt+L` | `Shift+→` | 向右选中文本 |

任何软件中都可以使用（VS Code、浏览器、记事本、PowerShell、Windows Terminal 等）。

## 安装

```powershell
powershell -ExecutionPolicy Bypass -File AutoHotKey\install.ps1
```

脚本会自动完成全部步骤：
1. 检测 AutoHotKey v2 是否已安装，**未安装则自动通过 winget 安装**
2. 在当前用户开机启动目录创建快捷方式
3. 询问是否立即启动脚本

> 如果 winget 安装失败，也可以从 [autohotkey.com](https://www.autohotkey.com/) 手动安装后重新运行脚本。

### 验证

启动后系统托盘会出现 AutoHotKey 图标（绿色 H），按 `Alt+I/J/K/L` 即可使用方向键功能。

## 卸载

删除开机启动快捷方式即可：

```
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\vi-arrows.lnk
```

如果有 AutoHotKey 图标在系统托盘，右键点击并选择 Exit。
