#!/bin/bash

set -e

_pwd=$(dirname $0)
[[ -h $0 ]] && _pwd=$(dirname $(readlink $0))

_dc="docker compose --project-directory ${_pwd}"

function start() {
	${_dc} up -d
}

function stop() {
	${_dc} down
	exit 0
}

# trap ctrl+c
trap stop INT

start
echo -e "\n\033[0;32mpress ctrl+c to exit \n\033[m"
sleep infinity
