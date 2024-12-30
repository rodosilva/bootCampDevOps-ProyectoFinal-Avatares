#!/bin/bash


#echo "========== Copy Files ============="
#cp ../BackEnd/Dockerfile ./backEnd.Dockerfile
#cp ../FrontEnd/Dockerfile ./frontEnd.Dockerfile

# Directorio de trabajo
HOMEDIR=$(dirname $PWD)
if [[ $(grep -e "HOMEDIR" .compose.env) ]]
then
  echo "HOMEDIR ya existe"
  else
    echo -e "\nHOMEDIR='$HOMEDIR'" >> .compose.env
fi

# Capturando las variables de entorno
echo "========== Environment Variables =========="
source .compose.env
export HOMEDIR
export FLASK_APP
export FLASK_ENV
export VITE_HOST
export VITE_PORT

echo "Environment Variable: FLASK_APP=$FLASK_APP"
echo "Environment Variable: FLASK_ENV=$FLASK_ENV"
echo "Environment Variable: VITE_HOST=$VITE_HOST"
echo "Environment Variable: VITE_PORT=$VITE_PORT"

echo "========== Running Scripts =========="
echo "This is the Working Directory: $HOMEDIR"
$HOMEDIR/BackEnd/buildDocker.sh
$HOMEDIR/FrontEnd/buildDocker.sh

echo "========== Compose ================"
docker-compose --env-file ./.compose.env up


