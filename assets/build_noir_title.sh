#!/usr/bin/env bash
set -euo pipefail

asset_dir=$(cd "$(dirname "$0")" && pwd)
work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT

source_image="$asset_dir/hero-noir.png"
output_gif="$asset_dir/hitarth-noir.gif"
output_mp4="$asset_dir/hitarth-noir.mp4"

# The first frame is a complete title card. The film cut uses a slow push,
# analog grain, and a brief exposure jump; the README loop keeps movement
# localized so the GIF stays small enough to load on a GitHub profile.
ffmpeg -hide_banner -loglevel error -y -loop 1 -i "$source_image" \
  -vf "zoompan=z='1.02+0.035*on/80':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s=1200x400:fps=10,eq=brightness='if(between(t,2.5,2.7),0.035,0)':eval=frame,noise=alls=3:allf=t,format=yuv420p" \
  -t 8 -an -c:v libx264 -crf 18 -preset medium "$output_mp4"

ffmpeg -hide_banner -loglevel error -y -loop 1 -i "$source_image" \
  -filter_complex "[0:v]scale=960:320,format=rgba[base];color=c=black@0.0:s=130x320:r=8:d=7,format=rgba,geq=r='166':g='5':b='12':a='64*exp(-pow((X-65)/35,2))'[scan];[base][scan]overlay=x='630+220*t/7':y=0:eval=frame:format=auto[lit];color=c=black@0.0:s=36x36:r=8:d=7,format=rgba,geq=r='200':g='0':b='8':a='190*exp(-((X-18)*(X-18)+(Y-18)*(Y-18))/85)'[signal];[lit][signal]overlay=x='520+220*t/7':y='72+65*sin(PI*t/7)':eval=frame:format=auto,format=yuv420p[v]" \
  -map '[v]' -t 7 -an -c:v libx264 -crf 18 -preset medium "$work_dir/gif-source.mp4"

ffmpeg -hide_banner -loglevel error -y -i "$work_dir/gif-source.mp4" \
  -vf 'fps=8,palettegen=max_colors=96:stats_mode=diff' "$work_dir/palette.png"
ffmpeg -hide_banner -loglevel error -y -i "$work_dir/gif-source.mp4" -i "$work_dir/palette.png" \
  -lavfi 'fps=8[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=5' \
  -loop 0 "$output_gif"

printf 'Built %s and %s\n' "$output_gif" "$output_mp4"
