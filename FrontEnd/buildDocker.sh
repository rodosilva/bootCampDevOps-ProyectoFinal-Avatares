#!/bin/bash

# Llamando al script de Variables
. variables.sh

mkdir tempDir
cp ../web/package.json ./tempDir
cp -r ../web/ ./tempDir

echo "VITE_HOST=$VITE_HOST"
echo "VITE_PORT=$VITE_PORT"

# Construyendo la Imagen Docker
docker build \
    --build-arg VITE_HOST=${VITE_HOST} \
    --build-arg VITE_PORT=${VITE_PORT} \
    -t ${FRONT_TAG}:${FRONT_VERSION} \
    .