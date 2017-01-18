#Include VA.ahk

#CommentFlag //


FADE_IN_TIME := 200
MAX_VOLUME := 35


// Run clock
Run, clock/app/clock.exe, clock/app/

// Change output device to HDMI with volume 0.0
VA_SetDefaultEndpoint("Samsung", 0)
VA_SetMasterVolume(0.0)

// Set spotify as active window and enable shuffle mode
WinActivate, ahk_exe spotify.exe
SendInput ^s

// Start Alarm playlist
SendInput {Click, 41, 476, 2}

// Gradually raise the volume
volume := 0.0
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
