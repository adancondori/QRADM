#!/bin/bash
# this is a workaround for default node system installed on ebs
rm -rf /usr/bin/node
rm -rf /usr/bin/npm

nvm_path="/usr/local/nvm"
mkdir -p "$nvm_path"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | NVM_DIR="$nvm_path" bash
export NVM_DIR="$nvm_path"
#chmod +x $NVM_DIR/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "Successfully installed nvm"