# Imagen Base
FROM node:18-alpine

ARG VITE_HOST
ARG VITE_PORT

# Directorio de Trabajo
WORKDIR /app

# Copiando del archivo package.json
COPY ./tempDir/package.json .

# Instalación de dependencias y de "serve" para ayudar a las aplicaciones de una sola página
RUN npm install \
    && npm install -g serve

# Copiando el resto de archivos
COPY ./tempDir/web/ .

# Construir la aplicación
RUN npm run build

# Declarando el puerto que debería usarse
EXPOSE 5173

# Una vez construido el "dist" por el "run build" el CMD ejecutará (Luego del Spinup del contenedor)
# CMD [ "serve", "-s", "dist" ]
CMD [ "npm", "run", "dev" ]