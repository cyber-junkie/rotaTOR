#!/bin/bash
#                       __              ________  ______   _______                 __       
#                      /  |            /        |/      \ /       \               /  |      
#  ______    ______   _$$ |_     ______$$$$$$$$//$$$$$$  |$$$$$$$  |      _______ $$ |____  
# /      \  /      \ / $$   |   /      \  $$ |  $$ |  $$ |$$ |__$$ |     /       |$$      \ 
#/$$$$$$  |/$$$$$$  |$$$$$$/    $$$$$$  | $$ |  $$ |  $$ |$$    $$<     /$$$$$$$/ $$$$$$$  |
#$$ |  $$/ $$ |  $$ |  $$ | __  /    $$ | $$ |  $$ |  $$ |$$$$$$$  |    $$      \ $$ |  $$ |
#$$ |      $$ \__$$ |  $$ |/  |/$$$$$$$ | $$ |  $$ \__$$ |$$ |  $$ | __  $$$$$$  |$$ |  $$ |
#$$ |      $$    $$/   $$  $$/ $$    $$ | $$ |  $$    $$/ $$ |  $$ |/  |/     $$/ $$ |  $$ |
#$$/        $$$$$$/     $$$$/   $$$$$$$/  $$/    $$$$$$/  $$/   $$/ $$/ $$$$$$$/  $$/   $$/ 
# https://github.com/cyber-junkie/rotaTOR by CyberJunkie
#
# 

printf "To exit \e[32m rotaTOR \e[0m press \e[33m CRTL+C \e[0m\n"

#TOR check

echo -e "Lets check for Tor on this system.\n"
	tor="/etc/init.d/tor"


if [ -f $tor ];
	then
		echo -e "Tor > installed\n\n"
		echo -e "Starting Tor\n\n"
service tor start
	else
		echo -e "Tor is missing! Please run apt update && apt install tor\n"
	exit 
fi


# Timer based on seconds for TOR restart

	echo -e "Enter number of seconds before new IP: \c"

		read timer

if [ "$timer" -lt "45" ];
	then
		printf " \e[31m Warning!!! \e[0m Less than 45 seconds is not good due to latency and timouts\n"
		echo -e "Fine, as you wish :P \n"
	else
		echo -e "Starting timer \n"
fi

function control_c {
	echo -en "\nWait, Did you cover your tracks...jk\n"
service tor stop
	echo -en "You no longer using TOR\n"
exit $?
}

# ctrl+c and exit rotaTOR.
	trap control_c SIGINT


for (( ; ; ))
	do 
		sleep $timer
service tor restart
		echo -e "Grabbed a new IP, New IP coming in $timer \n"
done


