# automate-bip39helper-brainflayer-btc
Script to automate the installation and the creation of the [Bip39Helper](https://github.com/TheRealLordFractal/Bip39Helper) and [Brainflayer](https://github.com/ryancdotorg/brainflayer) to crack btc wallet


# Installation

Tested on Ubuntu 20.04.6 LTS

Copy all the commands and paste into terminal:
- Install all of needed package
- Clone this repo
- Download the address.txt file that contains all wallet address from 2023 that have balance > 250$
- Download already build file from Bip39Helper
- Clone the Brainflayer repo
- Compile it
- Create the needed .blf file from downloaded address.txt
```
sudo apt-get install openssl libgmp3-dev libimobiledevice-dev libplist-dev libusbmuxd-dev libssl-dev zlib1g-dev dh-autoreconf python2.7-dev ;

cd $HOME ;
git clone https://github.com/brottobhmg/automate-bip39helper-brainflayer-btc.git ;
cd automate-bip39helper-brainflayer-btc ;
mkdir foundkeys ;

wget https://www.dropbox.com/s/cotkuh1qdc1slil/address.txt ;

mkdir Bip39Helper ;
cd Bip39Helper ;
wget https://github.com/TheRealLordFractal/Bip39Helper/releases/download/1.02a/biphelper-v102a-X64linux ;
mv biphelper-v102a-X64linux bip39helper ;
chmod 777 bip39helper ;
cd ../ ;
wget https://raw.githubusercontent.com/TheRealLordFractal/Bip39Helper/1.02a/wordlist.txt ;

git clone https://github.com/ryancdotorg/brainflayer.git ;
cd brainflayer ;
make ;
./hex2blf $HOME/automate-bip39helper-brainflayer-btc/address.txt $HOME/automate-bip39helper-brainflayer-btc/address.blf ;
```

# Run
Start the script run.sh

# Configuration
If you want run more in parallel, modify the **4** on _for_ lines

# Future implementation
- Compile also on aarch64 like Raspberry PI 4B


