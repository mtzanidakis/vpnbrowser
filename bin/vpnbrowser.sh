#!/bin/bash
pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket
xhost +local:$(docker inspect --format='{{ .Config.Hostname }}' browser)
(cd $HOME/.local/vpnproxy; docker-compose up)
(cd $HOME/.local/vpnproxy; docker-compose down)
xhost -
pactl unload-module $(pactl list short modules | awk '/\/tmp\/pulseaudio.socket/ { print $1 }')
