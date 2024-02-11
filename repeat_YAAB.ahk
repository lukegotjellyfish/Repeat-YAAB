#NoEnv
#SingleInstance, Force
#Persistent
#MaxThreadsPerHotkey, 1
#Include CaptureScreen.ahk
Process, Priority,, High
SetBatchLines, -1
SendMode Input
SetWorkingDir %A_ScriptDir%


if (A_IsAdmin = 0)
{
	try
	{
		if (A_IsCompiled)
		{
			Run *RunAs "%A_ScriptFullPath%" /restart
		}
		else
		{
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
		}
	}
	ExitApp
}

loop_number := 999999

dir = Screenshots
if !FileExist(dir) {
	FileCreateDir, %dir%
}

*5::
{
	SoundBeep, 750, 500
	CaptureScreen(0, False, "./Screenshots/" A_Index "-" A_Now "-STARTED.png")
	Loop, %loop_number%
	{
		Sleep, 180000
		CaptureScreen(0, False, "./Screenshots/" A_Index "-" A_Now ".png")
		
		if (A_INDEX != loop_number) {
			Sleep, 1000
			Send, {ESC Down}{ESC Up}
			Sleep, 1000
			Send, {ESC Down}{ESC Up}
			Sleep, 1000
			Send, {Down Down}{Down Up}
			Sleep, 1000
			Send, {Down Down}{Down Up}
			Sleep, 1000
			Send, {ENTER Down}{ENTER Up}
			Sleep, 9000
		}
	}
}
return

*F2::Reload

