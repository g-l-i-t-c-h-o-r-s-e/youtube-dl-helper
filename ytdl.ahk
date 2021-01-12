#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance,Force ;Self Explenatory
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include ./Environment/Environment.ahk

;Default Variables Do Not Touch >:c
backup := "*.reg"
EnvGet, UserPath, USERPROFILE
ffmPath = %A_ProgramFiles%\ffmpeg
ytdlPath := UserPath . "\Videos\youtube"
ytbinary := "youtube-dl.exe"
ffbinary := "ffmpeg.exe"
ffBin := A_WorkingDir . "\bin\"
DisableForceMP4 := 0

youtubedldownload = https://yt-dl.org/latest/youtube-dl.exe
ffmpegdownload = https://web.archive.org/web/20200914210729if_/https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-20200826-8f2c1f2-win64-static.zip

;DownloadDir := UserPath . "\Downloads" ;testin shtuff
;msgbox, %DownloadDir%

;if Environment Variables are not backed up; do it once.
if !FileExist(backup) {
	msgbox, We need to Run the Script as Admin
	If (!A_IsAdmin){ ;we need the script to run as admin to make changes in Program Files!
		Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
	}
	
	msgbox, Backing Up Environment Variables...`nCheck Script Folder For .reg Files
	Env_UserBackup()
	Env_SystemBackup()
	
	Run, powershell -command "wget %youtubedldownload% -OutFile %A_ScriptDir%\youtube-dl.exe"
	RunWait, powershell -command "wget %ffmpegdownload% -OutFile %A_ScriptDir%\ffmpeg.zip"
	RunWait, powershell -command "Expand-Archive -LiteralPath %A_ScriptDir%\ffmpeg.zip -DestinationPath %A_ScriptDir%\ffmpeg"

	MsgBox,4,oWo,Add YouTube & FFMpeg folder to path?
	IfMsgBox, Yes
	{ 
		if !InStr(FileExist(ytdlPath), "D") 
		{
			FileCreateDir, %ytdlPath% ;create youtube directory in Videos folder
			Env_UserAdd("PATH", ytdlPath)   ;adds the "youtube" folder to the path; also once.
		}
		
				
		sleep, 20
		if !InStr(FileExist(ytbinary), "D") {
			FileMove, %ytbinary%, %ytdlPath%
			if !InStr(FileExist(ffmPath), "D") {
				msgbox, ffmpeg path does not exist, creating
				sleep, 100
				FileCreateDir, %ffmPath% ;create ffmpeg directory in programfiles
				sleep, 200
				FileMove, %ffBin%*.exe, %ffmPath%
				FileRemoveDir, %ffBin%
				Env_UserAdd("PATH", ffmPath)   ;adds the "youtube" folder to the path; also once.
			}
		}
	}	
	
	IfMsgBox, No
	{
	     ;nothing to see here 8===D~
	}
}

^+c::
leClip := clipboard
sleep, 10

;obsolete
;if youtube is not in clipboard, ignore.
;if !InStr(leClip, "youtu") {
;	return
;}
;else

Gui, Add, Edit, xCenter yCenter w425 h20 +Center vDestinationVar, %A_WorkingDir%
Gui, Add, Button, x2 y20 w420 h20 +Center vDoEt gDoItNao, -=-=-=-=-=-=-=-=-=-Assign File Destination-=-=-=-=-=-=-=-=-=-=-
Gui, Add, Checkbox, x4 y46 w140 h20 +Center vPlaylistVar, Download Entire Playlist?
Gui, Add, Checkbox, x281 y46 w140 h20 +Right vForceMP4, Force MP4 Download?
Gui, Show, xCenter yCenter h66 w425, Destination
sleep, 20
guicontrol,focus,DestinationVar
Send, {Tab}
Return

DoItNao:
Gui, Submit, NoHide
Gui, Destroy

;if custom destination does not exist; create the folder.
;Pandela And Siabus Were Here ;3 /)
IfNotExist, DestinationVar
	FileCreateDir, %DestinationVar%\

;if playlist box is not checked (default) then ignore playlist in url.
if (PlaylistVar = 0) {
	playlist := "--no-playlist"
}

;if playlist box is checked; then you can guess what happens.
if (PlaylistVar = 1) {
	playlist := ""
}

;the A/V selection dialog.
title := "                  Pick Your Poison"
SetTimer, ChangeButtonNames, 8 ;timer used to activate label that changes button names.
MsgBox, 4,ayylmao, %title%
IfMsgBox, Yes
{ 
	format := "--extract-audio --audio-format m4a --format bestaudio[ext=m4a]"
	DisableForceMP4 := 1 ;Set DisableForceMP4 var to 1 to make sure it doesnt break the Audio extraction option.
}

IfMsgBox, No
{
	format := "--format bestvideo+bestaudio/best"
}

;check if Force MP4 is disabled (Default).
if (ForceMP4 = 0) {
;do nothing LOL
}

;check if Force MP4 is enabled, if so then yeah you get a motherfucking mp4 my guy.
if (ForceMP4 = 1) && (DisableForceMP4 = 0) { ;Make sure DisableMP4 var is 0 to prevent Audio extraction option from breaking.
	format := "" ;clear the var first cus why not.
	sleep, 10
	format := "--format bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4 "
}


Dir := A_WorkingDir . "\"
Code = youtube-dl.exe  %playlist% --output %DestinationDir%\`%(title)s.`%(ext)s --restrict-filenames %format% "%leClip%" ;quit destroying mah strink bab >:c

;if "youtube" folder is not detected in PATH env variable; use binary within same folder as script
EnvGet, CheckPathEnvVar, PATH
If !RegExMatch(CheckPathEnvVar,"youtube") {
	Run, %Dir%%code%
	playlist := ""
	DisableForceMP4 := 0	
	Return
}
else
 Run, %code%
     playlist := ""
     DisableForceMP4 := 0
Return


ChangeButtonNames: 
If !WinExist("ayylmao")
{
	return ;Keep waiting, if window don't exist.
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
sleep, 5
Send, {Tab}
return
