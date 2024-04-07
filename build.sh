#!/bin/bash

# Navigate to the directory containing Dockerfile
cd "$(dirname "$0")" || exit
DOCKERFILE_DIR=$(pwd)

# Build the Docker image
docker build -t your_image_name:your_tag "$DOCKERFILE_DIR"
