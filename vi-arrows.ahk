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
;   Alt+W          → Cut prev word       (剪切前一个单词)
;   Alt+E          → Paste               (粘贴)
;   Shift+Alt+H    → Shift+Home         (选中到行首)
;   Shift+Alt+;    → Shift+End          (选中到行尾)
;   Shift+Alt+'    → Shift+Delete       (剪切)
; ============================================================

#SingleInstance Force

; Alt+W 累积的剪切缓冲区
_cutWords := ""

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

; Alt + W → 剪切前一个单词（累积到缓冲区，保留剪贴板原内容）
!w::
{
    global _cutWords
    saved := A_Clipboard                  ; 保存当前剪贴板
    A_Clipboard := ""                     ; 清空剪贴板，用于区分新内容
    Send "^+{Left}"                       ; 选中前一个单词
    Sleep 30
    Send "^x"                             ; 剪切
    if ClipWait(0.3) {                    ; 等待剪贴板就绪（最长 300ms）
        word := A_Clipboard
        if word != ""
            _cutWords := word . _cutWords ; 累积到缓冲（新词在前）
    }
    A_Clipboard := saved                  ; 恢复剪贴板
}

; Alt + E → 粘贴累积的剪切内容（连续按 Alt+W 删除的所有单词）
!e::
{
    global _cutWords
    if _cutWords == ""
        return
    saved := A_Clipboard
    A_Clipboard := _cutWords              ; 临时写入剪贴板
    Sleep 20
    Send "^v"                             ; 粘贴
    Sleep 50                              ; 等粘贴完成再恢复
    A_Clipboard := saved                  ; 恢复剪贴板
    _cutWords := ""                       ; 清空缓冲
}

; Alt + ' → 删除
!'::Send "{Del}"

; Shift + Alt + ' → Shift+Delete（剪切）
+!'::Send "+{Del}"
