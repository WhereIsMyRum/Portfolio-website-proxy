#!/bin/bash

set -e

STATIC_CACHE="/var/cache/nginx/static/"
API_CACHE="/var/cache/nginx/api/"

if [[ -f $STATIC_CACHE ]]
then
    rm  -r $STATIC_CACHE
else
    echo $STATIC_CACHE not found
fi

if [[ -f $API_CACHE ]]
then
    rm  -r $API_CACHE
else
    echo $API_CACHE not found
fi

exit 0
