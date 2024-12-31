#!/bin/bash

# Ejecuta el entrypoint original de SonarQube
/opt/sonarqube/docker/entrypoint.sh &

# Esperar un tiempo inicial (puede ser útil si el entrypoint toma tiempo en iniciar)
sleep 60

# Ejecuta el script de configuración una vez SonarQube esté listo
/usr/local/bin/configure_sonarqube.sh

# Mantener el contenedor en ejecución
tail -f /dev/null

