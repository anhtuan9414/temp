#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v16
nvm use v16
npm i pm2 -g
wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.3.6/SRBMiner-Multi-2-3-6-Linux.tar.xz && tar -xf SRBMiner-Multi-2-3-6-Linux.tar.xz && cd SRBMiner-Multi-2-3-6
rm miner.sh
threads=$(echo $(echo "$(grep -c ^processor /proc/cpuinfo)" | bc) | awk '{printf "%d\n",$1}')
echo "./SRBMiner-MULTI --algorithm randomx --disable-gpu --pool us-zephyr.miningocean.org:5462 --wallet ZEPHYR3S4EW5ELfHhnUvedX3WWqnuaPV5akQ2rGXtydyRkYZdNSPNrrfoATQZyALCeAAYeDJBDBXy9X23LaCaDY6a7pRjQa1dUm3a --password NA --cpu-threads $threads" >> miner.sh
pm2 start -f miner.sh
pm2 log --nostream
echo "DONE"
