#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# port to map locally to the docker container
LOCAL_PORT=$1
echo $LOCAL_PORT

REPO=lisaong
IMAGE=$(basename $DIR)
TAG="$(uname -m)"
FULL_TAG=${REPO}/${IMAGE}:${TAG}

docker run -d -p $LOCAL_PORT:80 $FULL_TAG /start.sh 128m
