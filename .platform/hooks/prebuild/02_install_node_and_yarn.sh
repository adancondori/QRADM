#!/bin/bash
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 12.22.7
nvm alias default 12.22.7
npm install --global yarn
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
echo "Successfully installed node $(node --version) on $(which node)"
echo "Successfully installed yarn $(yarn --version) on $(which yarn)"