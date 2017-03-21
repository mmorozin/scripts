#!/bin/bash

mem_available_percent=$(free -m | grep Mem: | awk '{print int($3/$2*100)}')
swap_available_percent=$(free -m | grep Swap: | awk '{print int($3/$2*100)}')

memory_limit=$1

echo -e "$(free -m | grep Mem: | awk '{ a=" M:"int($3/$2*100)"%/"; print a }' | tr -d '\040\011\012\015' ;free -m | grep Swap: | awk '{ a="S:"int($3/$2*100)"%"; print a }' | tr -d '\040\011\012\015')"

#while [ 1 ]; do
	if [ $mem_available_percent -gt $memory_limit ]; then
		notify-send "Warning" "Low Memory:\nMain memory: $mem_available_percent% used!\nSwap: $swap_available_percent% used!"
	fi
#	echo -e "Sleeping 60 seconds"
#	sleep 60
#done
 
