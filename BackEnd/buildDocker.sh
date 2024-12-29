#!/bin/bash

# Llamando al script de Variables
#. variables.sh

# Creando carpeta temporal
echo "Directory ===> BackEnd"
echo "This is the Working Directory: $HOMEDIR"
mkdir $HOMEDIR/BackEnd/tempDir
cp $HOMEDIR/api/requirements.txt $HOMEDIR/BackEnd/tempDir/
cp -r $HOMEDIR/api/ $HOMEDIR/BackEnd/tempDir/

#echo "FLASK_APP=$FLASK_APP"
#echo "FLASK_ENV=$FLASK_ENV"

# Construyendo la Imagen Docker
#docker build \
#    --build-arg FLASK_APP=${FLASK_APP} \
#    --build-arg FLASK_ENV=${FLASK_ENV} \
#    -t ${BACK_TAG}:${BACK_VERSION} \
#    .