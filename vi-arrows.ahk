; ============================================================
; vi-arrows.ahk — Alt 组合键映射为方向键 / 光标移动
; AutoHotKey v2
;
; 字符级移动：
;   Alt+I          → Up
;   Alt+K          → Down
;   Alt+J          → Left
;   Alt+L          → Right
;   Shift+Alt+I    → Shift+Up      (向上选中)
;   Shift+Alt+K    → Shift+Down    (向下选中)
;   Shift+Alt+J    → Shift+Left    (向左选中)
;   Shift+Alt+L    → Shift+Right   (向右选中)
;
; 单词级移动：
;   Alt+N          → Ctrl+Left     (左移一个单词)
;   Alt+M          → Ctrl+Right    (右移一个单词)
;   Shift+Alt+N    → Ctrl+Shift+Left  (向左选中一个单词)
;   Shift+Alt+M    → Ctrl+Shift+Right (向右选中一个单词)
; ============================================================

#SingleInstance Force

; Alt + I/J/K/L → 方向键（字符级）
!i::Send "{Up}"
!k::Send "{Down}"
!j::Send "{Left}"
!l::Send "{Right}"

; Shift + Alt + I/J/K/L → Shift + 方向键
+!i::Send "+{Up}"
+!k::Send "+{Down}"
+!j::Send "+{Left}"
+!l::Send "+{Right}"

; Alt + N/M → 单词级移动
!n::Send "^{Left}"
!m::Send "^{Right}"

; Shift + Alt + N/M → 选中单词
+!n::Send "^+{Left}"
+!m::Send "^+{Right}"
