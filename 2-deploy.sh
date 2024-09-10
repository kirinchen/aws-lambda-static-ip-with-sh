#!/bin/bash

cd ./lambdas/static-ip-lambda/
npm install
cd ../../

set -eo pipefail
ARTIFACT_BUCKET=$(cat bucket-name.txt)
TEMPLATE=template.yml

aws cloudformation package --template-file $TEMPLATE --s3-bucket $ARTIFACT_BUCKET --output-template-file out.yml
aws cloudformation deploy --template-file out.yml --stack-name lambda-static-ip --capabilities CAPABILITY_NAMED_IAM
