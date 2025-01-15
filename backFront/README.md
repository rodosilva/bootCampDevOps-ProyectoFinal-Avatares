## Intro
En este directorio `backFront` se encuentra el único script que necesitamos ejecutar para poder correr la aplicación de `Avatares` de forma local dentro de contenedores (Usando `Docker Compose`).

El script [runCompose.sh](./runCompose.sh) realizará los pasos necesarios para poner en marcha la aplicación.

## DESCRIPCIÓN
- [runCompose.sh](./runCompose.sh): Script que pone en marcha tanto el contenedor API (backend) como el WEB (frontend) usando DockerCompose

- [.compose.env](./.compose.env): Archivo que contiene las variables como las variables de entorno el cual es llamando durante la ejecución mediante `source`

- [docker-compose.yaml](./docker-compose.yaml): Archivo con las instrucciones adecuadas para construir ambos contenedores junto a las condiciones necesarias para su comunicación.

## REQUISITOS
Para poder ejecutar vamos a necesitar:
- **Docker Compose**: Preferible v2.30.0
- **Docker**: Preferible version 27.2.1
- **Git**: Preferible version 2.43.0
- **Bash**: Terminal con Bash

## PASOS
### 1. Clonaremos el repositorio en una carpeta local
```bash
git clone https://github.com/rodosilva/bootCampDevOps-ProyectoFinal-Avatares.git
```
Para luego ingresar al directorio
```bash
cd bootCampDevOps-ProyectoFinal-Avatares/backFront/
```

### 2. Ejecutaremos el script `runCompose.sh`
```bash
./runCompose.sh
```
Este script realiza básicamente 3 pasos. El primero tiene que ver con las variables de entorno, el segundo es ejecutar un par de scripts para crear las carpetas temporales `tempDir` y el tercero es correr el `Docker Compose`

### 3. Disfrutar de la Aplicación
Desde el `localhost` ya nos será posible de visualizar la aplicación.
Tan solo necesitamos ir a la URL:

[Avatares](http://localhost:5173)



