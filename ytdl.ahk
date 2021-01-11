#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DownloadDir := "`%USERPROFILE`%\Downloads"

^+c::
leClip := clipboard
sleep, 200

;if youtube is not in clipboard, ignore.
if !InStr(leClip, "youtu") {
	return
}
else
	

Gui, Add, Edit, xCenter yCenter w425 h20 +Center vDestinationVar, ~\Downloads
Gui, Add, Button, x2 y20 w420 h20 +Center vDoEt gDoItNao, -=-=-=-=-=-=-=-=-=-Assign File Destination-=-=-=-=-=-=-=-=-=-=-
Gui, Add, Checkbox, x4 y46 w140 h20 +Center vPlaylistVar, download entire playlist?
Gui, Show, xCenter yCenter h66 w425, Destination
sleep, 20
guicontrol,focus,DestinationVar
Send, {Tab}
Return

DoItNao:
Gui, Submit, NoHide
Gui, Destroy

;if playlist box is not checked (default) then ignore playlist in url.
if (PlaylistVar = 0) {
	playlist = --no-playlist
}

;if playlist box is checked; then you can guess what happens.
if (PlaylistVar = 1) {
	playlist := ""
}

;the A/V selection dialog.
title := "                  Pick Your Poison"
SetTimer, ChangeButtonNames, 8
MsgBox, 4,ayylmao, %title%
IfMsgBox, Yes
{ 
	format := "--extract-audio --audio-format m4a --format bestaudio[ext=m4a]"
}

IfMsgBox, No
{
	format := "--format bestvideo+bestaudio/best"
}

Dir := A_WorkingDir . "\"
Code = youtube-dl.exe %playlist% --output  %DestinationVar%\`%(title)s.`%(ext)s --restrict-filenames  %format% %leClip%


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

ChangeButtonNames: 
If !WinExist("ayylmao")
{
	return  ; Keep waiting, if window don't exist.
}		

;Change the button names of specific msgboxs, if they exist.
if WinExist("ayylmao")
{
	buttonName := "&Audio"
	buttonName2 := "&Video"
}

SetTimer, ChangeButtonNames, Off 
WinActivate 
ControlSetText, Button1, %buttonName%
ControlSetText, Button2, %buttonName2%
WinSet, AlwaysOnTop
return
