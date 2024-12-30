FROM sonarqube:community

# Instalar herramientas necesarias
USER root

RUN echo 'sonarqube ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers

RUN apt-get update && \
    apt-get install -y jq curl && \
    apt-get clean

# Copiar el script de configuración
COPY configure_sonarqube.sh /usr/local/bin/configure_sonarqube.sh

RUN chmod +x /usr/local/bin/configure_sonarqube.sh

USER sonarqube
# Usar el ENTRYPOINT original y ejecutar tu script después
ENTRYPOINT ["/bin/bash", "-c", "/opt/sonarqube/docker/entrypoint.sh && /usr/local/bin/configure_sonarqube.sh && tail -f /dev/null"]
