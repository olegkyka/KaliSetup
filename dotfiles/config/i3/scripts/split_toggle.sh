#!/usr/bin/sh

if [ ! -e  /tmp/i3_split_orientation.txt ]
then
	echo "h" > /tmp/i3_split_orientation.txt
fi

if [ $(cat /tmp/i3_split_orientation.txt) = "h" ]
then
	i3 split vertical
	echo "v" > /tmp/i3_split_orientation.txt
	notify-send "split vertical"
elif [ $(cat /tmp/i3_split_orientation.txt) = "v" ]
then
	i3 split horizontal
	echo "h" > /tmp/i3_split_orientation.txt
	notify-send "split horizontal"
else
	notify-send "Something went wrong with $0"
fi
