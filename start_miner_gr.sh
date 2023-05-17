#!/bin/bash
pkill pm2
pkill cpuminer-sse2
apt-get install bc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v10
nvm use v10
npm i pm2 -g
wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.29/cpuminer-opt-linux.tar.gz && tar -xf cpuminer-opt-linux.tar.gz
rm miner.sh
echo "./cpuminer-sse2 -a gr -o $2 -u $1 -p $3" >> miner.sh
pm2 delete all
pm2 start -f miner.sh
echo "DONE"
sleep 9999999999999999999999999999999999999
