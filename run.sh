#!/bin/bash

trap ctrl_c INT
function ctrl_c() {
        echo "***Trapped CTRL-C"
		kill $(ps aux | grep 'bip39helper' | awk '{print $2}')
		check_found
		exit
}

function check_found(){
	for i in {0..4}
	do
		cat /home/ubuntu/btc_crack/foundkeys/foundkeys$i.txt >> /home/ubuntu/btc_crack/foundkeys/foundkeysALL.txt
	done
	if [ -s /home/ubuntu/btc_crack/foundkeys/foundkeysALL.txt ] 
	then
		echo "filename exists and is > 0 bytes"
		echo "FOUND SOMETHING, FOUND SOMETHING"
		echo $(date +"%r")
		speaker-test -t sine -f 1000 -l 1 & sleep .8 && kill -9 $!
		echo -ne '\007'
		exit
	fi
}

echo " **************** Program START **************** "


cd /home/ubuntu/btc_crack/ ;
mkdir foundkeys ;

echo Starting the finder
for i in {0..4}
do
	> /home/ubuntu/btc_crack/foundkeys/foundkeys$i.txt
	/home/ubuntu/btc_crack/Bip39Helper/bip39helper -l 12 | /home/ubuntu/btc_crack/brainflayer/brainflayer -v -b /home/ubuntu/btc_crack/address.blf -o /home/ubuntu/btc_crack/foundkeys/foundkeys$i.txt & #&>/dev/null &
done
echo All finder started

while true
do
	sleep 300
	check_found
done

#/home/ubuntu/btc_crack/Bip39Helper0/bip39helper | /home/ubuntu/btc_crack/brainflayer0/brainflayer -v -b /home/ubuntu/btc_crack/address0.blf -o /home/ubuntu/btcCrack/brainflayer0/foundkeys.txt &





