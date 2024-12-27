FROM sonarqube:community

# Copiar el plugin personalizado
COPY sonar-custom-plugin-1.0.jar /opt/sonarqube/extensions/

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

# Modificar el punto de entrada para ejecutar SonarQube primero
# Iniciar SonarQube y luego ejecutar el script de configuración
ENTRYPOINT ["/bin/bash", "-c", "/opt/sonarqube/bin/sonar.sh start && /usr/local/bin/configure_sonarqube.sh"]
