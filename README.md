Jenkins, Prometheus, Grafana y SonarQube con Vagrant y Docker
Este repositorio automatiza la instalación y configuración de herramientas esenciales para la integración continua y monitoreo, utilizando Vagrant, Docker, y Docker Compose.

💻 Requisitos Previos
Antes de comenzar, asegúrate de tener instaladas las siguientes herramientas en tu máquina:

Vagrant
VirtualBox
Git
🚀 Instrucciones de Uso
1. Clonar el Repositorio
Clona este repositorio en tu máquina local:

git clone https://github.com/fcongedo/jenkins-prometheus-grafana-sonarqube.git
cd jenkins-prometheus-grafana-sonarqube
2. Iniciar la Máquina Virtual con Vagrant
Navega al directorio Vagrant y ejecuta:

vagrant up
Este comando iniciará una máquina virtual y configurará automáticamente las siguientes herramientas dentro de contenedores Docker:

Jenkins: http://localhost:8080
SonarQube: http://localhost:9000
Grafana: http://localhost:3000
Prometheus: http://localhost:9090
3. Conexión SSH
Para conectarte a la máquina virtual:

vagrant ssh
4. Detener la Máquina Virtual
Cuando termines, puedes detener la máquina virtual ejecutando:

vagrant halt
5. Destruir la Máquina Virtual
Si deseas eliminar completamente la máquina virtual:

vagrant destroy
🛠️ Proceso Automático de Configuración
Al ejecutar vagrant up, se realizará automáticamente lo siguiente:

Ajuste de parámetros del sistema:

Configuración de vm.max_map_count.
Instalación de Dependencias:

Actualización de paquetes del sistema.
Instalación de Docker y Docker Compose.
Configuración de Docker para evitar el uso de sudo.
Clonación del Repositorio:

El código fuente se clona en la máquina virtual.
Construcción y Ejecución de Contenedores:

Construcción de imágenes Docker.
Inicio de los contenedores con los servicios configurados.
🖼️ Ejemplo del Proceso:
Al ejecutar vagrant up, verás el sigiuente progreso de instalación:

Al ejecutar vagrant up, verás un progreso similar al siguiente

📝 Acceso a Jenkins:
El acceso a Jenkins se puede hacer directamente en http://localhost:8080

El usuario y la contraseña por defecto son:

Usuario: admin
Contraseña: admin
🔑 Acceso a SonarQube:
El acceso a SonarQube se puede hacer directamente en http://localhost:9000

El usuario y la contraseña por defecto son:

Usuario: admin
Contraseña: administrator
📊 Acceso a Grafana:
Puedes acceder a Grafana en http://localhost:3000

El usuario y la contraseña por defecto son:

Usuario: admin
Contraseña: admin
📈 Acceso a Prometheus:
Puedes acceder a Prometheus en http://localhost:9090

🐳 Ejecutar Solo con Docker:
1.🌐 Crear una Red Docker

Este paso es opcional pero recomendable si necesitas una red personalizada para los contenedores. Puedes crear una red llamada back-tier con el siguiente comando:
docker network create back-tier || true
Este comando creará la red back-tier si no existe. Si ya está creada, el || true evitará errores y continuará ejecutándose.

2.⚙️ Construir las Imágenes Docker

A continuación, construye las imágenes de Docker. Esto descargará las últimas versiones de las dependencias y las construirá sin usar imágenes de caché:
docker-compose build --pull --no-cache
Este comando construirá las imágenes de todos los servicios definidos en el archivo docker-compose.yml.

3.🚀 Iniciar los Contenedores en Segundo Plano

Una vez que las imágenes estén construidas, puedes iniciar los contenedores en segundo plano ejecutando:
docker-compose up -d
Esto levantará los contenedores definidos en docker-compose.yml en modo "desprendido" (detached), lo que significa que seguirán ejecutándose en segundo plano.

4.✅ Verificar los Contenedores en Ejecución

Para verificar que los contenedores estén funcionando correctamente, puedes usar:
docker ps
5.🛑 Detener los Contenedores

Si deseas detener los contenedores, puedes usar el siguiente comando:
docker-compose down
📚 Más Información:
Docker: Visitar la documentación de Docker
Vagrant: Visitar la documentación de Vagrant
Prometheus: Visitar la documentación de Prometheus
Grafana: Visitar la documentación de Grafana
SonarQube: Visitar la documentación de SonarQube