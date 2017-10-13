#!/bin/bash

#check data
clear
if [ ! -f /home/$USER/sshN_main.sh ]; then
		echo "FATAL ERROR"
	    	echo "~/sshN_main.sh not found!"
		echo "sshN_main.sh should be in your home directory."
	        sleep 2
		exit 0;
fi
if [ ! -f /home/$USER/.cache/logintime.txt ]; then
		echo "creating logintime.txt"
		touch /home/$USER/.cache/logintime.txt
		sleep 5
fi
if [ ! -f /home/$USER/.cache/logouttime.txt ]; then
		echo "creating logouttime.txt"
		touch /home/$USER/.cache/logouttime.txt
		sleep 5
fi
echo "DATA CHECK SUCCESSFUL"
sleep 1
#check end

resize -s 10 25
clear
echo "SSH NOTIFIER IS RUNNING"
echo "Cntrl + C to exit"
while true ; do /home/$USER/sshN_main.sh & sleep .3; done

