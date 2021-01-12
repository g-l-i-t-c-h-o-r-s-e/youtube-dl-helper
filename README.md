# youtube-dl-helper
An AutoHotKey Script Made To Download Youtube Videos and Music <3<br>
Download AutoHotKey from: https://www.autohotkey.com/<br>
Download `youtube-dl.exe` from https://github.com/ytdl-org/youtube-dl/releases<br>
Download full ffmpeg (from before they cut some codec support) from https://web.archive.org/web/20200914210729if_/https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-20200826-8f2c1f2-win64-static.zip<br><br>

1. After Downloading `youtube-dl.exe` & `ffmpeg.exe` <br/> **place `youtube-dl.exe` and the ffmpeg `bin` folder; into the root script folder**;<br/>then run the script for the first time.
2. Allow the script to add ffmpeg and youtube-dl to your PATH Environment Variable.
3. Profit.

# To use:
1.	Copy Youtube URL
2.	Press at the same time: `Ctrl+Shift+C`

# Features:
• Easy to use<br/>
• ~~Ignores url's that aren't YouTube~~ Adding Bigger Whitelist Soon<br/>
• Optional Playlist download checkbox<br/>
• Has Option to Extract Audio or Force MP4 output<br/>
• Automatically downloads Video and Audio at highest quality<br>
• Custom output folder; just enter the name of the folder you want it all in and it'll make for you<br/>
• Prompts for output directory; otherwise you can quickly press Enter key to use default (the same folder script is in)<br/>
• Optionally add the `youtube` folder to the `PATH` environment variable and make a `youtube` folder in your Videos folder for the binary to reside<br/>


# Tips:
• Its suggested to move this script into the `Videos\youtube` folder after first installation for the full experience. However, the Destination window will populate with whatever folder the script is in so feel free to do whatever.<br/>

• To create a custom output folder; add a backwardslash and name to the current destination string visible.<br/>  
For example: add `\MachineGirl` to `C:\Users\username\Videos\youtube`; to make it `C:\Users\username\Videos\youtube\MachineGirl`
• You can you the `A` or `V` key on your keyboard to select Audio or Video on the dialog when prompted.<br/>

• When the Destination window pops up, just press `Enter` if you want the video to download in the same folder as the script.<br/>

• You can also press `Tab` once, Then `Space` once (to select the playlist option), `Tab` Three times, Then `Enter` once more for a faster playlist download workflow.<br/>

• youtube-dl does require ffmpeg to be installed as an environment variable (like in the PATH variable) as far as I know; however you can run this script in the same folder as youtube-dl.exe without having to set the youtube-dl.exe folder to the PATH envoronment variable.<br/>

