#!/bin/bash
a=`last -F|awk '{ print $11 }'|head -n 1`
if [ "`cat ~/.cache/logintime.txt`" == `last -F|awk '{ print $7 }'|head -n 1` ]; then

	if [ "`cat ~/.cache/logouttime.txt`" == "`last -F|awk '{ print $13 }'|head -n 1`" ]; then
		exit;
	else
		if [ "`last -F|awk '{ print $9 }'|head -n 1`" == "-" ]; then
			ip=`last|awk '{print $3}'|head -n 1`	
			logouttime=`last -F|awk '{ print $13 }'|head -n 1`	
			notify-send "SSH logout: $ip @ $logouttime"
			echo "$logouttime" > ~/.cache/logouttime.txt
		fi	
	fi
else
	if [ "$a" == "in" ]; then
		logintime=`last -F|awk '{ print $7 }'|head -n 1`
		ip=`last|awk '{print $3}'|head -n 1`
		notify-send "SSH login: $ip @ $logintime"
		echo "$logintime" > ~/.cache/logintime.txt	
	fi
fi










