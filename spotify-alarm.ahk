#Include VA.ahk

#CommentFlag //


FADE_IN_TIME := 300
MAX_VOLUME := 20


// Set spotify as active window and enable shuffle mode
WinActivate, ahk_exe spotify.exe
SendInput ^s

// Start Alarm playlist
SendInput {Click, 41, 476, 2}

// Run clock, with a delay
Sleep, 1000
Run, clock/app/clock.exe, clock/app/

// Set initial volume to zero
volume := 0.0
VA_SetMasterVolume(0.0)

// Gradually raise the volume
volume_step := 100.0 / FADE_IN_TIME
while volume <= 100.0 {
	volume += volume_step
	VA_SetMasterVolume(volume)
	Sleep, 1000
}


^!+p::
if (volume > MAX_VOLUME) {
	VA_SetMasterVolume(MAX_VOLUME)
}
ExitApp
