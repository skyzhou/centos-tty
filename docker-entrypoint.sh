#!/bin/bash
set -e


: ${USER:=root}

if [ -z "$PASSWORD" ]; then
	echo >&2 'error: missing required PASSWORD environment variable'
	exit 1
fi



sed -ri  's/"USER"\s*:\s*"PASSWORD"/"'$USER'":"'$PASSWORD'"/' /usr/src/console/config.json 


exec "$@"
