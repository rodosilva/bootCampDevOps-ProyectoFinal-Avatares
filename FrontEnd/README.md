## INTRO
Este directorio `FrontEnd` contiene los archivos necesarios para poder construir la `Imagen` de `Docker` de `Web`
Sin embargo, por si solo no desplegará la `Infraestructura` necesaria para contener a toda la aplicación de `Avatares`

El directorio `backFront` contiene el [docker-compose.yaml](../backFront/docker-compose.yaml). Dicho archivo utiliza el contenido de este directorio (`BackEnd`) junto al contenido de `FrontEnd` para así levantar a la aplicación de `Avatares` de forma local.

## DESCRIPCIÓN
- [variables.sh](./variables.sh): Contiene a las variables y a las variables de entorno
- [buildDocker.sh](./buildDocker.sh): Script para construir la Imagen Docker
- [Dockerfile](./Dockerfile): Código base para la Imagen Docker
- [runDocker.sh](./runDocker.sh): Script para correr la imagen una vez creada