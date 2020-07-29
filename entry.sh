#!/bin/sh -e

echo "application support dir: ${HOME}/Library/Application Support/Plex Media Server"

echo "tailing local pms server logs"
# pms will rotate pre-seeded log files, background pause race condition
(sleep 3 && tail -f "$HOME/Library/Logs/Plex Media Server/"*.log) &

echo "> $@" && exec "$@"
