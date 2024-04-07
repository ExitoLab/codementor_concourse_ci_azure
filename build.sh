#!/bin/bash

# Navigate to the directory containing Dockerfile
cd "$(dirname "$0")" || exit
DOCKERFILE_DIR=$(pwd)
IMAGE_NAME=demo
IMAGE_TAG=v1.0.0

# Build the Docker image
docker build -t $IMAGE_NAME:$IMAGE_TAG "$DOCKERFILE_DIR"
