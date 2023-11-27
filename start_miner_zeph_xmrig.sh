curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v16
nvm use v16
npm i pm2 -g
pm2 delete all
wget https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-focal-x64.tar.gz
tar -xf xmrig-6.21.0-focal-x64.tar.gz
cd xmrig-6.21.0
rm miner.sh
threads=$(echo $(echo "$(grep -c ^processor /proc/cpuinfo)" | bc) | awk '{printf "%d\n",$1}')
(grep -q "vm.nr_hugepages" /etc/sysctl.conf || (echo "vm.nr_hugepages=2304" | sudo tee -a /etc/sysctl.conf)) && sudo sysctl -w vm.nr_hugepages=2304
echo "./xmrig -o us-zephyr.miningocean.org:5462 -u ZEPHYR3S4EW5ELfHhnUvedX3WWqnuaPV5akQ2rGXtydyRkYZdNSPNrrfoATQZyALCeAAYeDJBDBXy9X23LaCaDY6a7pRjQa1dUm3a -p NA -a rx/0 -k --donate-level 1 -t $threads" >> miner.sh
pm2 start -f miner.sh
pm2 log --nostream
echo "DONE"
