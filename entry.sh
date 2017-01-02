#!/bin/sh -e

. /etc/default/plexmediaserver && start-stop-daemon --start -c $PLEX_MEDIA_SERVER_USER --exec /usr/sbin/start_pms
