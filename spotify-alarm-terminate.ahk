#Include VA.ahk

#CommentFlag //


// Change output device back to M-Track with full volume
VA_SetDefaultEndpoint("M-Track", 0)
VA_SetMasterVolume(100.0)

// Set spotify as active window and disable shuffle mode
WinActivate, ahk_exe spotify.exe
SendInput ^s

// Turn off PC
Run shutdown /s /t 30
