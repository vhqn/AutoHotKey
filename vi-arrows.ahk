; ============================================================
; vi-arrows.ahk — Alt+I/J/K/L 系统全局映射为方向键
; AutoHotKey v2
;
; 快捷键映射：
;   Alt+I          → Up
;   Alt+K          → Down
;   Alt+J          → Left
;   Alt+L          → Right
;   Shift+Alt+I    → Shift+Up    (向上选中)
;   Shift+Alt+K    → Shift+Down  (向下选中)
;   Shift+Alt+J    → Shift+Left  (向左选中)
;   Shift+Alt+L    → Shift+Right (向右选中)
; ============================================================

#SingleInstance Force

; Alt + I/J/K/L → 方向键
!i::Send "{Up}"
!k::Send "{Down}"
!j::Send "{Left}"
!l::Send "{Right}"

; Shift + Alt + I/J/K/L → Shift + 方向键 (文本选择)
+!i::Send "+{Up}"
+!k::Send "+{Down}"
+!j::Send "+{Left}"
+!l::Send "+{Right}"
