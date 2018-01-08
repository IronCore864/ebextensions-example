#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Please specify application name"
    echo "Usage:"
    echo "  $0 [app_name]"
    echo ""
    exit 1
fi

APP_NAME=$1
DESC="$APP_NAME service"

aws elasticbeanstalk create-application --application-name $APP_NAME --description "$DESC"

S3_BUCKET=$EB_APP_NAME"-deploy"

if aws s3api head-bucket --bucket $S3_BUCKET ; then
    echo "S3 bucket used for deployment already exists"
else
    aws s3api create-bucket --bucket $S3_BUCKET --create-bucket-configuration LocationConstraint=eu-central-1
fi

