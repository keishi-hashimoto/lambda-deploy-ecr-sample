#!/bin/bash

set -Cexo pipefail

uv pip compile pyproject.toml -o "${REQUIREMENTS_FILE}"

docker buildx build --platform linux/amd64 \
    --build-arg REQUIREMENTS_FILE="${REQUIREMENTS_FILE}" \
    --provenance=false -t "${ECR_REPOSITORY}:${IMAGE_TAG}" .