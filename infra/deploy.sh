#!/bin/bash
echo "Building React app..."
npm run build

echo "Deploying infrastructure..."
cd infra/
terraform apply -auto-approve

echo "Deployment complete!"
terraform output cloudfront_url