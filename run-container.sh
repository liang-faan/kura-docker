#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# port to map locally to the docker container
LOCAL_PORT=${1:80}

REPO=lisaong
IMAGE=$(basename $DIR)
TAG="$(uname -m)"
FULL_TAG=${REPO}/${IMAGE}:${TAG}

GLUSTER_MOUNT=/mnt/kura

if [ -d $GLUSTER_MOUNT ]; then
	docker run -d -p $LOCAL_PORT:80 -v $GLUSTER_MOUNT:$GLUSTER_MOUNT $FULL_TAG /start.sh 128m
else
	docker run -d -p $LOCAL_PORT:80 $FULL_TAG /start.sh 128m
fi
