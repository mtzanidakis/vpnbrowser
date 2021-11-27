#!/bin/bash
set -e
xhost +local:
(cd $HOME/.local/vpnbrowser; docker-compose up; docker-compose down)
xhost -
