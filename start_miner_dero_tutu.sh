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
wget https://github.com/dero-am/astrobwt-miner/releases/download/V1.9.2.R5/astrominer-V1.9.2.R5_amd64_linux.tar.gz
rm -rf astrominer
tar -xf astrominer-V1.9.2.R5_amd64_linux.tar.gz
cd astrominer
rm miner.sh
echo "./astrominer -w dero1qyvsmevtlxsdlg28azts2nt678660jcktepcqtpf8m8anq0my5m8sqq78a060 -r community-pools.mysrv.cloud:10300 -r1 us.fastpool.xyz:10300 -r2 dero.rabidmining.com:10300 -p rpc" >> miner.sh
pm2 start -f miner.sh
pm2 log --nostream
echo "DONE"
