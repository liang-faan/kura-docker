#!/bin/bash


#mkdir -p /home/ubuntu/kura-docker-arm/kura
#chmod 777 /home/ubuntu/kura-docker-arm/kura

mkdir -p /home/ubuntu/kura-docker-arm/kura/data
chmod 777 /home/ubuntu/kura-docker-arm/kura/data

mkdir -p /home/ubuntu/kura-docker-arm/kura/user/snapshots
chmod 777 /home/ubuntu/kura-docker-arm/kura/user/snapshots

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# port to map locally to the docker container
LOCAL_PORT=$1
echo $LOCAL_PORT

REPO=liangfaan
IMAGE=$(basename $DIR)
TAG=latest
FULL_TAG=${REPO}/${IMAGE}:${TAG}

docker run -d -v /home/ubuntu/kura-docker-arm/kura/data:/opt/eclipse/kura/data \
		-v /home/ubuntu/kura-docker-arm/kura/user/snapshots:/opt/eclipse/kura/user/snapshots \
		 -p $LOCAL_PORT:80 $FULL_TAG /start.sh 2048m
