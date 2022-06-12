#!/usr/bin/env bash
image_name="qradm/deployment:latest"
docker build -f docker/compose/deployment/Dockerfile -t "$image_name" .
docker run --rm -ti -v $(pwd)/docker/compose/deployment/.aws:/root/.aws -v $(pwd):/deployment "$image_name" "$1"
