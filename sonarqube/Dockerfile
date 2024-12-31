FROM sonarqube:community

# Instalar herramientas necesarias
USER root

RUN echo 'sonarqube ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers

RUN apt-get update && \
    apt-get install -y jq curl && \
    apt-get clean

# Copiar el script de configuración y el script de arranque
COPY configure_sonarqube.sh /usr/local/bin/configure_sonarqube.sh
COPY start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/configure_sonarqube.sh /usr/local/bin/start.sh

USER sonarqube

# Usar el script start.sh como ENTRYPOINT
ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]

