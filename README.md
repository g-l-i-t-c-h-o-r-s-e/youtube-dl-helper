# youtube-dl-helper
An AutoHotKey Script Made To Swiftly Download Youtube Content & More <3 <3<br>
<br/>
You'll need to download autohotkey so it can run in administrator mode to backup your environment variables.<br/>
Grab a copy from: https://www.autohotkey.com/download/ahk-install.exe<br/>

1. ~~After Downloading `youtube-dl.exe` & `ffmpeg.exe` <br/> **place `youtube-dl.exe` and the ffmpeg `bin` folder; into the root script folder**;<br/>then run the script for the first time.~~ **this is added automagically now!~**<br/>
__**2. Allow the script to add ffmpeg and youtube-dl to your PATH Environment Variable.**__<br/>
**3. Profit.**

# To use:
1.	Copy Video URL
2.	Press at the same time: `Ctrl+Shift+C`<br/>
3. Press `Enter` or `A` or `V`

**Destination HotKeys (when menu is active):**<br/>
`D:` Downloads Folder<br/>
`R:` Root/Parent Folder Script is Within<br/>
`P:` Custom Folder (WIP)<br/>
`Y:` Videos/youtube Folder<br/>
`M:` Music Folder<br/>
`V:` Videos Folder<br/>
`U:` Update Target URL with Current Clipboard or Update Batch Input Value<br/>

**Features:**<br/>
• Easy to use<br/>
• Optional Playlist download checkbox<br/>
• Has Option to Extract Audio or Force MP4 output<br/>
• Automatically downloads Video and Audio at highest quality<br>
• Optionally add `youtube-dl` & `ffmpeg` folder to the `PATH` environment variable<br/>
• Batch/Multiple URL input to download hundreds of videos or playlists at once lmfao<br/>
• Prompts for output directory; otherwise you can quickly press Enter key to use default<br/>
• Custom output folder; just enter the name of the folder you want it all in and it'll make for you<br/>
• The option to bulk download hundreds of videos simultaneously, or one at a time.<br/>
• Audio notification when downloads have finished processing.


# Tips:
•You would only need to use the `U` update HotKey in the case that the gui/menu _was already open_ and you wanted to use a different URL or you updated the batch input file.<br/>

• To create a custom output folder; add a backwardslash and name to the current destination string visible.<br/>For example: add `\MachineGirl` to `C:\Users\username\Videos\youtube`; to make it `C:\Users\username\Videos\youtube\MachineGirl`

• You can you the `A` or `V` key on your keyboard to select Audio or Video on the dialog when prompted.<br/>

• When the Destination window pops up, just press `Enter` if you want the video to download in the same folder as the script.<br/>

• The Destination HotKeys only work when the Destination editbox is not active/selected; or when the entire window is active.<br/>

• You can also press `Tab` once, Then `Space` once (to select the playlist option), `Tab` Three times, Then `Enter` once more for a faster playlist download workflow.<br/>

• youtube-dl does require ffmpeg to be installed as an environment variable (like in the PATH variable) as far as I know; however you can run this script in the same folder as youtube-dl.exe without having to set the youtube-dl.exe folder to the PATH environment variable.<br/>~~and you might have to use the ForceMP4 mode if you dont setup ffmpeg in the PATH~~<br/>

• Websites Supported by youtube-dl: http://ytdl-org.github.io/youtube-dl/supportedsites.html <br/>

Tip us with Bitcoin if you wanna! We'd appreciate it a ton: `17YcpEtKybVHAoTgirJy94p1Hygtbvh21p`
