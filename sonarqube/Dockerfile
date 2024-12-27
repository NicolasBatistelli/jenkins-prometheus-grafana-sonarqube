FROM sonarqube:lts-community

# Instalar herramientas necesarias
USER root
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copiar el script de configuración al contenedor
COPY configure_sonarqube.sh /usr/local/bin/configure_sonarqube.sh
RUN chmod +x /usr/local/bin/configure_sonarqube.sh

# Modificar el punto de entrada para ejecutar el script después de iniciar SonarQube
ENTRYPOINT ["/bin/bash", "-c", "/opt/sonarqube/bin/run.sh & /usr/local/bin/configure_sonarqube.sh"]
