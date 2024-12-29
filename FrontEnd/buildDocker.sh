#!/bin/bash

# Llamando al script de Variables
#. variables.sh

# Creando carpeta temporal
echo "Directory ===> FrontEnd"
echo "This is the Working Directory: $HOMEDIR"
mkdir $HOMEDIR/FrontEnd/tempDir
cp $HOMEDIR/web/package.json $HOMEDIR/FrontEnd/tempDir
cp -r $HOMEDIR/web/ $HOMEDIR/FrontEnd/tempDir

#echo "VITE_HOST=$VITE_HOST"
#echo "VITE_PORT=$VITE_PORT"

# Construyendo la Imagen Docker
#docker build \
#    --build-arg VITE_HOST=${VITE_HOST} \
#    --build-arg VITE_PORT=${VITE_PORT} \
#    -t ${FRONT_TAG}:${FRONT_VERSION} \
#    .