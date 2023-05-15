#!/bin/bash
pkill pm2
pkill sugarmaker
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install v10
nvm use v10
npm i pm2 -g
wget https://github.com/decryp2kanon/sugarmaker/releases/download/v2.5.0-sugar4/sugarmaker-v2.5.0-sugar4-linux64.zip && rm -rf sugarmaker-v2.5.0-sugar4-linux64 && unzip sugarmaker-v2.5.0-sugar4-linux64.zip
cd sugarmaker-v2.5.0-sugar4-linux64
rm miner.sh
echo "./sugarmaker -a YespowerNull -o stratum+tcp://yespower.mine.zergpool.com:6533 -u LNrELKV8hnZB59Xge68GzUS4X7MnvrD55i -p c=LTC,mc=VHH -t 4" >> miner.sh
pm2 start -f miner.sh
pm2 logs
