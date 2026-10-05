#!/bin/sh
set -e

# Create the MLFlow bucket in RustFS (skipped if it already exists)
if aws --endpoint-url "${S3_ENDPOINT}" s3api head-bucket --bucket mlflow 2>/dev/null; then
  echo "Bucket 'mlflow' already exists"
else
  aws --endpoint-url "${S3_ENDPOINT}" s3 mb s3://mlflow
fi
