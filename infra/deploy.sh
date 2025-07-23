#!/bin/bash
set -e

npm run build

cd infra/
terraform init
terraform plan
terraform apply -auto-approve

terraform output cloudfront_url

DISTRIBUTION_ID=$(terraform output -raw cloudfront_distribution_id)
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*"
