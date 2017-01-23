#Include VA.ahk

#CommentFlag //


// Set spotify as active window and disable shuffle mode
WinActivate, ahk_exe spotify.exe
SendInput ^s

// Turn off PC
Run shutdown /s /t 30
