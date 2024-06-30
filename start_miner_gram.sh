#!/bin/bash
pm2 delete all
sudo kill $(cat ~/.pm2/pm2.pid)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v16
nvm use v16
npm i pm2 -g
pm2 delete all
wget https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.84/lolMiner_v1.84_Lin64.tar.gz
tar -xf lolMiner_v1.84_Lin64.tar.gz
cd 1.84
rm miner.sh
echo "./lolMiner -a GRAM --pool lolminer.ton.ninja:9999 --ton-mode 6 --user UQA8iI8Muj-5KgUUI1W5Ylb5Z2rdXR8eAktlEHdnMWJ9RvuV" >> miner.sh
pm2 start -f miner.sh
pm2 log --nostream
echo "DONE1"
