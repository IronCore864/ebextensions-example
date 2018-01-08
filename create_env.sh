#!/bin/bash

if [ "$#" -lt 3 ]; then
    echo "Please specify app name, env name and label"
    echo "Usage:"
    echo "  $0 app env label"
    echo ""
    exit 1
fi

EB_APP_NAME=$1
EB_ENV_NAME=$2
LABEL=$3

aws elasticbeanstalk create-environment --application-name $EB_APP_NAME --environment-name $EB_ENV_NAME --cname-prefix $EB_ENV_NAME --version-label $LABEL --solution-stack-name "64bit Amazon Linux 2017.03 v4.3.0 running Node.js" --option-settings file://options.json
