#!/usr/bin/env bash
set -euo pipefail

asset_dir=$(cd "$(dirname "$0")" && pwd)
work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT

source_image="$asset_dir/hero-dossier.png"
output_gif="$asset_dir/hitarth-film.gif"
output_mp4="$asset_dir/hitarth-film.mp4"

# A complete title card remains visible in every frame. The camera breathes
# slowly while a soft warm light crosses the case file once per loop.
ffmpeg -hide_banner -loglevel error -y -loop 1 -i "$source_image" \
  -filter_complex "[0:v]zoompan=z='1.035+0.012*sin(2*PI*on/80)':x='iw/2-(iw/zoom/2)+6*sin(2*PI*on/80)':y='ih/2-(ih/zoom/2)':d=1:s=1200x400:fps=10,noise=alls=2:allf=t,format=rgba[base];color=c=white@0.0:s=240x400:r=10:d=8,format=rgba,geq=r='255':g='199':b='145':a='32*exp(-pow((X-120)/54,2))'[light];[base][light]overlay=x='-w+(W+w)*t/8':y=0:eval=frame:format=auto,format=yuv420p[v]" \
  -map '[v]' -t 8 -an -c:v libx264 -crf 18 -preset medium "$output_mp4"

ffmpeg -hide_banner -loglevel error -y -loop 1 -i "$source_image" \
  -filter_complex "[0:v]scale=960:320,format=rgba[base];color=c=white@0.0:s=160x320:r=8:d=7,format=rgba,geq=r='255':g='199':b='145':a='78*exp(-pow((X-80)/38,2))'[light];[base][light]overlay=x='-w+(W+w)*t/7':y=0:eval=frame:format=auto[lit];color=c=white@0.0:s=48x48:r=8:d=7,format=rgba,geq=r='255':g='55':b='30':a='210*exp(-((X-24)*(X-24)+(Y-24)*(Y-24))/130)'[dot];[lit][dot]overlay=x='600+42*t':y='220-105*sin(PI*t/7)':eval=frame:format=auto,format=yuv420p[v]" \
  -map '[v]' -t 7 -an -c:v libx264 -crf 18 -preset medium "$work_dir/gif-source.mp4"

ffmpeg -hide_banner -loglevel error -y -i "$work_dir/gif-source.mp4" \
  -vf 'fps=8,palettegen=max_colors=96:stats_mode=diff' "$work_dir/palette.png"
ffmpeg -hide_banner -loglevel error -y -i "$work_dir/gif-source.mp4" -i "$work_dir/palette.png" \
  -lavfi 'fps=8[x];[x][1:v]paletteuse=dither=bayer:bayer_scale=5' \
  -loop 0 "$output_gif"

printf 'Built %s and %s\n' "$output_gif" "$output_mp4"
