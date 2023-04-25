#!/bin/bash
pkill pm2
pkill astrominer
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v10
nvm use v10
npm i pm2 -g
pm2 delete all
wget https://github.com/dero-am/astrobwt-miner/releases/download/V1.9/astrominer-V1.9_generic_amd64_linux.tar.gz
tar -xf astrominer-V1.9_generic_amd64_linux.tar.gz
rm miner.sh
echo "./astrominer -w $1 -r community-pools.mysrv.cloud:10300 -r1 dero.rabidmining.com:10300 -p rpc" >> miner.sh
pm2 start -f miner.sh
echo "DONE"
