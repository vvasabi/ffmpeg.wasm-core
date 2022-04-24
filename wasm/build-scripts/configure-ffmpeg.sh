#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
#    --enable-gpl            # required by x264
#    --enable-nonfree        # required by fdk-aac
#    --enable-zlib           # enable zlib
#    --enable-libx264        # enable x264
#    --enable-libx265        # enable x265
#    --enable-libvpx         # enable libvpx / webm
#    --enable-libwavpack     # enable libwavpack
#    --enable-libmp3lame     # enable libmp3lame
#    --enable-libfdk-aac     # enable libfdk-aac
#    --enable-libtheora      # enable libtheora
#    --enable-libvorbis      # enable libvorbis
#    --enable-libfreetype    # enable freetype
#    --enable-libopus        # enable opus
#    --enable-libwebp        # enable libwebp
#    --enable-libass         # enable libass
#    --enable-libfribidi     # enable libfribidi


  --disable-avdevice       # disable libavdevice build
#  --disable-avcodec       # disable libavcodec build
#  --disable-avformat      # disable libavformat build
  --disable-swresample     # disable libswresample build
  --disable-swscale        # disable libswscale build
  --disable-postproc       # disable libpostproc build
#  --disable-avfilter       # disable libavfilter build
  # --enable-libaom         # enable libaom

  # Inspired by: https://gist.github.com/gyk/49dc80c58691a21a1c5f5e16926beaa6
  --disable-everything
  --enable-filter=concat
  --enable-decoder=h264,aac,mp3
  --enable-parser=h264,aac,mp3
  --enable-demuxer=concat,flv,mov,mpegts,h264,aac,mp3,live_flv,mp4
  --enable-muxer=flv,mov,mpegts,mp4
  --enable-protocol=concat,file,pipe
  --enable-bsf=aac_adtstoasc,h264_mp4toannexb
  --enable-small
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
