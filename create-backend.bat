@ECHO OFF

set AWS_REGION=us-east-1
set AWS_BUCKET_S3=brstworkshop1

echo Creating bucket s3
aws s3 mb s3://%AWS_BUCKET_S3% --region %AWS_REGION%

echo Result
echo 'aws_region: %AWS_REGION%'
echo 'aws_bucket_s3: %AWS_BUCKET_S3%'
