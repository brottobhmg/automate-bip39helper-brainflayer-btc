#!/bin/bash

readonly BASE_PATH=$HOME/automate-bip39helper-brainflayer-btc

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
		cat $BASE_PATH/foundkeys/foundkeys$i.txt >> $BASE_PATH/foundkeys/foundkeysALL.txt
	done
	if [ -s $BASE_PATH/foundkeys/foundkeysALL.txt ] 
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

echo Starting the finder
for i in {0..4}
do
	> $BASE_PATH/foundkeys/foundkeys$i.txt
	$BASE_PATH/Bip39Helper/bip39helper -l 12 | $BASE_PATH/brainflayer/brainflayer -v -b $BASE_PATH/address.blf -o $BASE_PATH/foundkeys/foundkeys$i.txt & #&>/dev/null &
done
echo All finder started

while true
do
	sleep 300
	check_found
done






