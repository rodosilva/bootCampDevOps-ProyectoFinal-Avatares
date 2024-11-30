#!/bin/bash

# Llamando al script de Variables
. variables.sh

echo "FLASK_APP=$FLASK_APP"
echo "FLASK_APP=$FLASK_ENV"

export FLASK_APP
export FLASK_APP

docker run --rm \
    --name ${BACK_TAG} \
    -w /app \
    -e FLASK_APP -e FLASK_ENV \
    -p 5000:5000 \
    ${BACK_TAG}:${BACK_VERSION}