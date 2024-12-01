#!/bin/bash

# Llamando al script de Variables
. variables.sh

echo "VITE_HOST=$VITE_HOST"
echo "VITE_PORT=$VITE_PORT"

export VITE_HOST
export VITE_PORT

docker run --rm \
    --name ${FRONT_TAG} \
    -w /app \
    --env VITE_HOST --env VITE_PORT \
    -h frontendContainer \
    -p ${VITE_PORT}:${VITE_PORT} \
    ${FRONT_TAG}:${FRONT_VERSION}