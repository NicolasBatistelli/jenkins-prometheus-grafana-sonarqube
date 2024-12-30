FROM sonarqube:community

# Instalar herramientas necesarias
USER root
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copiar el script de configuración
COPY configure_sonarqube.sh /usr/local/bin/configure_sonarqube.sh
RUN chmod +x /usr/local/bin/configure_sonarqube.sh

# Usar el ENTRYPOINT original y ejecutar tu script después
CMD ["/bin/bash", "-c", "/usr/local/bin/configure_sonarqube.sh"]
