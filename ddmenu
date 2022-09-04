#!/bin/bash

# ddmenu -- dir dmenu, select files in directories
# args:
# $1 -- dir to list

if [[ -z $1 ]]; then
	echo "usage: $0 dir"
	exit 1
fi

TO_LIST=$(readlink -f $1)

dmenu_dir() {
	ls -1a "$TO_LIST" | dmenu "$@"
}

while [ -d "$TO_LIST" ]; do
	CURR=$(dmenu_dir)
	if [[ -z $CURR ]]; then
		exit 1
	fi
	TO_LIST="$TO_LIST/$CURR"
done

echo "$TO_LIST"
exit 0
