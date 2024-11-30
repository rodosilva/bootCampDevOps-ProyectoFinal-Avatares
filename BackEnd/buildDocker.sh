#!/bin/bash

# Llamando al script de Variables
. variables.sh

# Creando carpeta temporal
mkdir tempDir
cp ../api/requirements.txt ./tempDir/
cp -r ../api/ ./tempDir/

echo "FLASK_APP=$FLASK_APP"
echo "FLASK_ENV=$FLASK_ENV"

# Construyendo la Imagen Docker
docker build \
    --build-arg FLASK_APP=${FLASK_APP} \
    --build-arg FLASK_ENV=${FLASK_ENV} \
    -t ${BACK_TAG}:${BACK_VERSION} \
    .