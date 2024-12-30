#!/bin/bash

echo "Esperando a que SonarQube esté listo..."
max_attempts=30  # 30 intentos = 5 minutos
attempts=0
while true; do
  if nc -z localhost 9000 && curl -s http://localhost:9000 | grep -q 'Log in'; then
    echo "SonarQube está listo."
    break
  else
    if [ "$attempts" -ge "$max_attempts" ]; then
      echo "Tiempo de espera agotado. SonarQube no está listo después de 5 minutos."
      exit 1
    fi
    echo "SonarQube no está listo, reintentando en 10 segundos..."
    attempts=$((attempts+1))
    sleep 10
  fi
done
