FROM sonarqube:community

# Instalar herramientas necesarias
USER root

RUN apt-get update && apt-get install -y \
    curl \
    jq

# Copiar el script de configuración
COPY configure_sonarqube.sh /usr/local/bin/configure_sonarqube.sh
RUN chmod +x /usr/local/bin/configure_sonarqube.sh && chown sonarqube:sonarqube /usr/local/bin/configure_sonarqube.sh

USER sonarqube

# Usar el ENTRYPOINT original y ejecutar tu script después
#CMD ["/bin/bash", "-c", "/usr/local/bin/configure_sonarqube.sh"]
