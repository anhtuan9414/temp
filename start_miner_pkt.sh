#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v10
nvm use v10
npm i pm2 -g
wget https://github.com/cjdelisle/packetcrypt_rs/releases/download/packetcrypt-v0.5.2/packetcrypt-v0.5.2-linux_amd64 && chmod +x packetcrypt-v0.5.2-linux_amd64
rm miner.sh
echo "./packetcrypt-v0.5.2-linux_amd64 ann -p $1 http://pool.pkt.world http://pool.pktpool.io http://pool.pkteer.com https://stratum.zetahash.com" >> miner.sh
pm2 delete all
pm2 start -f miner.sh
echo "DONE"
sleep 99999999999999999999999999999999999999
