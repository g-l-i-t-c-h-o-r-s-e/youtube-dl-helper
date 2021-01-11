# youtube-dl-helper
An AutoHotKey Script Made To Download Youtube Videos and Music <3<br>
Download AutoHotKey from: https://www.autohotkey.com/<br>
Download youtube-dl.exe from https://github.com/ytdl-org/youtube-dl/releases<br>
Download full ffmpeg (from before they cut some codec support) from https://web.archive.org/web/20200914210729if_/https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-20200826-8f2c1f2-win64-static.zip<br><br>


Add both to PATH environment variables
1.	Create folder: 	`C:\Program Files\youtube-dl`
	*	Place `youtube-dl.exe` in it
2.	Extract ffmpeg
	1.	Rename folder to ffmpeg
	2.	Place ffmpeg folder in: `C:\Program Files`
3.	click Start menu
4.	Search for "edit the system environment variables"
5.	Click "Environment Variables"
6.	Select Path on the top and click Edit
7.	Click New
8.	Paste in: `C:\Program Files\youtube-dl`
9.	Click OK
10.	Repeat with: `C:\Program Files\ffmpeg\bin`

# To use:
1.	Copy Youtube URL
2.	Press at the same time: `Ctrl+Shift+C`

# Features:
• Easy to use<br/>
• Ignores url's that aren't YouTube<br/>
• Optional Playlist download checkbox<br/>
• Has Option to Extract Audio or Force MP4 output<br/>
• Prompts for output directory; otherwise you can quickly press Enter key to use default (the same folder script is in)<br/>

# Tips:
• You can you the `A` or `V` key on your keyboard to select Audio or Video on the dialog when prompted.<br/>
• When the Destination window pops up, just press `Enter` if you want the video to download in the same folder as the script.<br/>
• You can also press `Tab` once, Then `Space` once (to select the playlist option), `Tab` Three times, Then `Enter` once more for a faster playlist download workflow.<br/>
• youtube-dl does require ffmpeg to be installed as an environment variable (like in the PATH variable) as far as I know; however you can run this script in the same folder as youtube-dl.exe without having to set the youtube-dl.exe folder to the PATH envoronment variable.<br/>
