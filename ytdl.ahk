#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^+c::
leClip := clipboard
sleep, 200

;if youtube is not in clipboard, ignore.
if !InStr(leClip, "youtu") {
	return
}
else


Gui, Add, Edit, xCenter yCenter w420 h20 +Center vDestinationVar, %A_ScriptDir%
Gui, Add, Button, xCenter y20 w420 h15 +Center vDoEt gDoItNao
Gui, Show, xCenter yCenter h40 w420, Destination
sleep, 20
guicontrol,focus,DestinationVar
Send, {Tab}
Return

DoItNao:
Gui, Submit, NoHide
Gui, Destroy

;if playlist is detected, do some fancy shit.
if InStr(leClip, "&list=") {
	MsgBox, 4, , I see your video is within a playlist; download this single video?
	
	IfMsgBox, No
		
	{
	;if you select No it will download the entire playlist.
	playlist := ""
	}
	
	IfMsgBox, Yes
	;if you select Yes then it passes instruction to not download playlist
	playlist = --no-playlist 
}

Dir := A_WorkingDir . "\"
Code = youtube-dl.exe %playlist% --output  %DestinationVar%\1`%(title)s.`%(ext)s --restrict-filenames --format bestvideo+bestaudio/best  %leClip%


;if "youtube" folder is not detected in PATH env variable; use binary within same folder as script
EnvGet, CheckPathEnvVar, PATH
If !RegExMatch(CheckPathEnvVar,"youtube-dl") {
;msgbox, shiet
Run,  %code% ;had to use backslash?
	Return
}
else
     Run, %code%
playlist := ""
Return
