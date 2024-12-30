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
#CMD ["/bin/bash", "-c", "sleep 60 && /usr/local/bin/wait.sh && /usr/local/bin/configure_sonarqube.sh"]
