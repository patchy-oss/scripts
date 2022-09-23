#!/bin/bash

if [[ "$#" -lt 1 ]]; then
	echo "usage: $0 [-d dirname] path"
	exit 1
fi

OPTIND=1
TYPE_DIR=0
while getopts "d:" opt; do
	case "$opt" in
		d)
			TYPE_DIR=1
			DIRNAME=$OPTARG
			;;
	esac
done
shift $((OPTIND-1))

MUSIC_PATH="$1"
if [[ $TYPE_DIR -eq 1 ]]; then
	mkdir $DIRNAME
	find $MUSIC_PATH -regextype posix-egrep -regex ".*/.+\.(mp3|flac|opus)" \
		-exec zsh -c 'readlink -f "$0" | { read fname; ln -s $fname "$(readlink -f $1)/$(basename $fname)" }' {} $DIRNAME \;
else
	find $MUSIC_PATH -regextype posix-egrep -regex ".*/.+\.(mp3|flac|opus)" \
		-exec readlink -f {} \; | sort
fi
