#!/bin/bash

set -e

DOCKER_IMAGE=$1
DOCKER_COMPOSE_FILE="docker-compose.prod.yml"

# Check for arguments
if [[ $# -lt 1 ]]
then
    git pull
    docker-compose -f $DOCKER_COMPOSE_FILE stop nginx
    docker-compose -f $DOCKER_COMPOSE_FILE up nginx
else
    docker-compose -f $DOCKER_COMPOSE_FILE pull "$DOCKER_IMAGE"
    docker-compose -f $DOCKER_COMPOSE_FILE stop "$DOCKER_IMAGE"
    docker-compose -f $DOCKER_COMPOSE_FILE up "$DOCKER_IMAGE" -d
fi

exit 0