#!/bin/bash
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

EB_APP_STAGING_DIR=$(/opt/elasticbeanstalk/bin/get-config platformconfig -k AppStagingDir)
cd $EB_APP_STAGING_DIR
nvm use 12.22.7
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#BUNLDER_VER_TO_INSTALL=$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n1 | tr -d ' ')
#gem install bundler -v "$BUNLDER_VER_TO_INSTALL"
#bundle config set --local deployment true
#bundle "$BUNLDER_VER_TO_INSTALL" install --deployment

yarn install