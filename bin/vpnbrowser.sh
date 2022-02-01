#!/bin/bash

set -e

_dc="docker compose --project-directory $(pwd)"

function start() {
	xhost +local:
	${_dc} up -d
}

function stop() {
	${_dc} down
	xhost -
	exit 0
}

# trap ctrl+c
trap stop INT

start
echo -e "\n\033[0;32mpress ctrl+c to exit \n\033[m"
sleep infinity
