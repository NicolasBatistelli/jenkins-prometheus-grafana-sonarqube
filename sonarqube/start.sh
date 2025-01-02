#!/bin/bash

# Ejecuta el entrypoint original de SonarQube
/opt/sonarqube/docker/entrypoint.sh &

# Esperar a que SonarQube esté listo
echo "Esperando a que SonarQube esté listo..."
until curl -s http://localhost:9000 | grep -q 'Log in'; do
  echo "Esperando... SonarQube aún no está listo."
  sleep 10
done

# Ejecuta el script de configuración una vez SonarQube esté listo
/usr/local/bin/configure_sonarqube.sh

# Mantener el contenedor en ejecución
tail -f /dev/null
