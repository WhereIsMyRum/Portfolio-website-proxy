#!/bin/bash

set -e

DOCKER_IMAGE=$1
DOCKER_COMPOSE_FILE="docker-compose.prod.yml"

# Check for arguments
if [[ $# -lt 1 ]]
then
    sudo docker-compose -f $DOCKER_COMPOSE_FILE stop nginx
    sudo docker-compose -f $DOCKER_COMPOSE_FILE up -d nginx
else
    sudo docker-compose -f $DOCKER_COMPOSE_FILE pull "$DOCKER_IMAGE"
    sudo docker-compose -f $DOCKER_COMPOSE_FILE stop "$DOCKER_IMAGE"
    sudo docker-compose -f $DOCKER_COMPOSE_FILE up -d "$DOCKER_IMAGE"
    sudo docker-compose -f $DOCKER_COMPOSE_FILE exec redis redis-cli flushall || echo "REDIS cache cleared"
    sudo docker-compose exec nginx /bin/bash /usr/src/scripts/clear-cache.sh || echo "NGINX cache cleared"
fi

exit 0
