#!/bin/bash
apt-get install bc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v10
nvm use v10
npm i pm2 -g
wget https://github.com/Hansen333/Hansen33-s-DERO-Miner/releases/latest/download/hansen33s-dero-miner-linux-amd64.tar.gz
name=$RANDOM
mv hansen33s-dero-miner-linux-amd64.tar.gz $name
tar -xf $name
rm miner.sh
mv hansen33s-dero-miner-linux-amd64 $name
threads=$(echo $(echo "$(grep -c ^processor /proc/cpuinfo)" | bc) | awk '{printf "%d",$1}')
echo "./$name -daemon-rpc-address $1 -wallet-address $2 -mining-threads 1 -workers $threads" >> miner.sh
pm2 start -f miner.sh
echo "DONE"
sleep 99999999999999999999999999999
