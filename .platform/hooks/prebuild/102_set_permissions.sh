#!/bin/bash
#EB_APP_STAGING_DIR=$(/opt/elasticbeanstalk/bin/get-config platformconfig -k AppStagingDir)
sudo chown webapp:webapp -R /var/app/*
sudo chmod 777 -R /var/app/*
# export $(cat /opt/elasticbeanstalk/deployment/env | xargs)