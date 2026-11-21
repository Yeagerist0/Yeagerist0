#!/usr/bin/env bash
set -euo pipefail

asset_dir=$(cd "$(dirname "$0")" && pwd)
work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT

source_image="$asset_dir/hero-noir.png"
insert_image="$asset_dir/surveillance-noir.png"
output_gif="$asset_dir/hitarth-noir-v2.gif"
output_mp4="$asset_dir/hitarth-noir-v2.mp4"

# The first frame is a complete title card. Brief hard cuts reveal a second
# surveillance angle; the film cut adds a slow push and analog exposure jump.
ffmpeg -hide_banner -loglevel error -y -loop 1 -framerate 10 -i "$source_image" \
  -loop 1 -framerate 10 -i "$insert_image" \
  -filter_complex "[0:v]scale=1200:400,format=rgba[title];[1:v]scale=1200:400,format=rgba[insert];[title][insert]overlay=x=0:y=0:enable='between(t,2.1,2.6)+between(t,5.0,5.4)'[cut];[cut]zoompan=z='1.015+0.025*on/80':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1200x400:fps=10,eq=brightness='if(between(t,2.6,2.8),0.045,0)':eval=frame,noise=alls=2:allf=t,format=yuv420p[v]" \
  -map '[v]' -t 8 -an -c:v libx264 -crf 19 -preset medium "$output_mp4"

ffmpeg -hide_banner -loglevel error -y -loop 1 -framerate 8 -i "$source_image" \
  -loop 1 -framerate 8 -i "$insert_image" \
  -filter_complex "[0:v]scale=960:320,format=rgba[title];[1:v]scale=960:320,format=rgba[insert];[title][insert]overlay=x=0:y=0:enable='between(t,2.0,2.375)+between(t,5.0,5.25)'[base];color=c=black@0.0:s=130x320:r=8:d=7,format=rgba,geq=r='166':g='5':b='12':a='64*exp(-pow((X-65)/35,2))'[scan];[base][scan]overlay=x='630+220*t/7':y=0:eval=frame:format=auto[lit];color=c=black@0.0:s=36x36:r=8:d=7,format=rgba,geq=r='200':g='0':b='8':a='190*exp(-((X-18)*(X-18)+(Y-18)*(Y-18))/85)'[signal];[lit][signal]overlay=x='520+220*t/7':y='72+65*sin(PI*t/7)':eval=frame:format=auto,format=yuv420p[v]" \
  -map '[v]' -t 7 -an -c:v libx264 -crf 18 -preset medium "$work_dir/gif-source.mp4"

ffmpeg -hide_banner -loglevel error -y -i "$work_dir/gif-source.mp4" \
  -vf 'fps=8,palettegen=max_colors=96:stats_mode=diff' "$work_dir/palette.png"
ffmpeg -hide_banner -loglevel error -y -i "$work_dir/gif-source.mp4" -i "$work_dir/palette.png" \
  -lavfi 'fps=8[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=5' \
  -loop 0 "$output_gif"

printf 'Built %s and %s\n' "$output_gif" "$output_mp4"
