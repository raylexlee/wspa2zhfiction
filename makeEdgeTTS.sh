#!/usr/bin/env bash
TXT=${1?'missing text file'}
SRT=$(sed 's/txt$/srt/' <<< $TXT)
MP3=$(sed 's/txt$/mp3/' <<< $TXT)
MP4=$(sed 's/txt$/mp4/' <<< $TXT)
start=$(date +%s)
edge-tts --voice zh-HK-WanLungNeural --rate=-10% --file $TXT --write-media $MP3 --write-subtitles $SRT
end=$(date +%s)
echo ---- $((end - start))s $MP3
start=$(date +%s)
ffmpeg -f lavfi -i color=c=black:s=1920x1080:r=30 -i $MP3 -c:v libx264 -pix_fmt yuv420p -c:a copy -shortest $MP4  >/dev/null 2>&1
end=$(date +%s)
echo ==== $((end - start))s $MP4
