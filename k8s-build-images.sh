#!/bin/bash
docker build -f auth-api/Dockerfile -t fabfab/auth-api:v1 .
docker build -f transaction-api/Dockerfile -t fabfab/transaction-api:v1 .
docker build -f loyalty-worker/Dockerfile -t fabfab/loyalty-worker:v1 .

docker push fabfab/auth-api:v1
docker push fabfab/transaction-api:v1
docker push fabfab/loyalty-worker:v1