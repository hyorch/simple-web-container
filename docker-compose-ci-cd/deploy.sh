#!/bin/bash
source .env_dev

echo "----------------Loging to AWS ECR-------------------"
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com


echo "----------------Building the image-------------------"
docker-compose --env-file .env_dev build

echo "----------------Pushing the image to ECR-------------------"
docker tag webapp:$TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:$TAG
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME:$TAG