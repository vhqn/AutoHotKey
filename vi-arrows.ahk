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
;
; 行级 / 编辑：
;   Alt+H          → Home                (行首)
;   Alt+;          → End                 (行尾)
;   Alt+'          → Delete              (删除)
;   Shift+Alt+H    → Shift+Home         (选中到行首)
;   Shift+Alt+;    → Shift+End          (选中到行尾)
;   Shift+Alt+'    → Shift+Delete       (剪切)
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

; Alt + H → 行首
!h::Send "{Home}"

; Shift + Alt + H → 选中到行首
+!h::Send "+{Home}"

; Alt + ; → 行尾（SC027 = 分号键的扫描码）
!SC027::Send "{End}"

; Shift + Alt + ; → 选中到行尾
+!SC027::Send "+{End}"

; Alt + ' → 删除
!'::Send "{Del}"

; Shift + Alt + ' → Shift+Delete（剪切）
+!'::Send "+{Del}"
