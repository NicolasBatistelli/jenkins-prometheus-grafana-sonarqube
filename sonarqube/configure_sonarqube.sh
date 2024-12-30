#!/bin/bash

SONAR_URL="http://localhost:9000"
OLD_PASSWORD="admin"
NEW_PASSWORD="administrator"
TOKEN_NAME="jenkins-token"
USERNAME="admin"

# Esperar a que SonarQube esté disponible
until curl -s "$SONAR_URL/api/system/status" | jq -e '.status' | grep -q "UP"; do
    echo "Esperando a que SonarQube esté disponible..."
    sleep 5
done

echo "SonarQube está disponible. Configurando..."

# Cambiar la contraseña inicial
curl -X POST -u "$USERNAME:$OLD_PASSWORD" \
  "$SONAR_URL/api/users/change_password" \
  -d "login=$USERNAME&password=$NEW_PASSWORD&previousPassword=$OLD_PASSWORD"

# Crear un token de autenticación
TOKEN=$(curl -X POST -u "$USERNAME:$NEW_PASSWORD" \
  "$SONAR_URL/api/user_tokens/generate" \
  -d "name=$TOKEN_NAME" | jq -r '.token')

echo "Token generado: $TOKEN"

# Guardar el token para su uso posterior
echo "$TOKEN" > /opt/sonarqube/conf/sonarqube_token
