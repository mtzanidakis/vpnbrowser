#!/bin/bash
set -e
pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket
xhost +local:
(cd $HOME/.local/vpnproxy; docker-compose up; docker-compose down)
xhost -
pactl unload-module $(pactl list short modules | awk '/\/tmp\/pulseaudio.socket/ { print $1 }')
