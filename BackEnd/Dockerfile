# Imagen Base
FROM python:3.10-alpine

# Variables de Entorno
ARG FLASK_APP
ARG FLASK_ENV

# Directorio de Trabajo
WORKDIR /app

# Copiar Archivos
COPY ./tempDir/requirements.txt .
COPY ./tempDir/api/* .

# Instalar Dependencias
RUN pip3 install -r requirements.txt

COPY tempDir/api/ /app/api/

EXPOSE 5000

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]