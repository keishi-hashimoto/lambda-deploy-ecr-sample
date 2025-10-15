#!/bin/bash

set -Cxeo pipefail

CONTAINER_ID="$(docker run -d --platform linux/amd64 -p 9000:8080 "${ECR_REPOSITORY}:${IMAGE_TAG}")"

curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"msg": "hello world"}'

docker stop "${CONTAINER_ID}"