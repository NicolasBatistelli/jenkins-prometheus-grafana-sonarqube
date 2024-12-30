#!/bin/bash

echo "Esperando a que SonarQube esté listo..."
while true; do
  if curl -s http://localhost:9000 | grep -q 'Log in'; then
    echo "SonarQube está listo."
    break
  else
    echo "SonarQube no está listo, reintentando en 10 segundos..."
    sleep 10
  fi
done
