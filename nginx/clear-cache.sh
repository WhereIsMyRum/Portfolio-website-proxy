#!/bin/bash

set -e

STATIC_CACHE="/var/cache/nginx/static/"
SITES_CACHE="/var/cache/nginx/sites"
API_CACHE="/var/cache/nginx/api/"

if [[ -e $STATIC_CACHE ]]
then
    rm  -r $STATIC_CACHE
else
    echo $STATIC_CACHE not found
fi

if [[ -e $API_CACHE ]]
then
    rm  -r $API_CACHE
else
    echo $API_CACHE not found
fi

if [[ -e $SITES_CACHE ]]
then 
    rm -r $SITES_CACHE
else
    echo $SITES_CACHE not found
fi

exit 0
