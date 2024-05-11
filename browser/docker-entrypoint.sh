#!/bin/sh
set -e
_ffprof=/shared/firefox-profile.tar
[ -f ${_ffprof} ] && tar -xf ${_ffprof} -C $HOME
exec firefox --private-window 'about:blank'
