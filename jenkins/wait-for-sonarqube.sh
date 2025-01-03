#!/bin/bash

# Ruta del token de SonarQube
#TOKEN_PATH="/opt/sonarqube/conf/sonarqube_token"

#echo "Iniciando script de espera para SonarQube..."

# Esperar hasta que el token esté disponible
#until [ -f "$TOKEN_PATH" ]; do
#    echo "Esperando token de SonarQube en $TOKEN_PATH..."
#   sleep 5
#done

# Leer el token de SonarQube
#SONAR_TOKEN=$(cat "$TOKEN_PATH")
#export SONAR_TOKEN

#echo "Token de SonarQube encontrado: $SONAR_TOKEN"
#echo "Iniciando Jenkins..."

# Ejecutar el script de arranque de Jenkins
#exec /usr/local/bin/jenkins.sh
