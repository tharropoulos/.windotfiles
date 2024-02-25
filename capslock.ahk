; Setup environment
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; CapsLock as a layer modifier key
#HotkeyModifierTimeout 100 ; prevents sticking of layer key

;CapsLock is turned off, can be toggled with CapsLock + Esc
SetCapsLockState, AlwaysOff

CapsLock::
KeyWait, CapsLock, T0.4 ; Wait for 0.5 seconds to see if any other key is pressed
if (A_PriorKey = "CapsLock") ; If CapsLock was pressed alone
    Send, {Esc} ; Send the Esc key
return

Shift & CapsLock::
GetKeyState, CapsLockState, Shift, T
if CapsLockState = D
    SetCapsLockState, AlwaysOff
else
    SetCapsLockState, AlwaysOn
KeyWait, CapsLock
return

#If GetKeyState("CapsLock", "P")
    ; The symbols are: ! = Alt, ^ = Ctrl, + = Shift
    0::Home
    4::End
    k::Up
    h::Left
    j::Down
    l::Right
    
    ; Ctrl + direction key for faster moves
    e::^Up
    b::^Left
    d::^Down
    w::^Right
    
    n::^Backspace
    m::Delete
    
    p::Home
    `;::End
    [::PgUp
    '::PgDn
    Esc::
    
    u::Enter
    
    c::`
    -::~

#InputLevel 1
; Backspace::Return ; this disables the backspace in case you want train your muscle memory
#InputLevel 0