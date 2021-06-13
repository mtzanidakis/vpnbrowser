#!/bin/bash
set -e
pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket
xhost +local:
(cd $HOME/.local/vpnproxy;
export COUNTRY=${1:-gre};
envsubst < vpn/vpn.conf.template > vpn/vpn.conf;
docker-compose up; docker-compose down;
rm -f vpn/vpn.conf)
xhost -
pactl unload-module $(pactl list short modules | awk '/\/tmp\/pulseaudio.socket/ { print $1 }')
