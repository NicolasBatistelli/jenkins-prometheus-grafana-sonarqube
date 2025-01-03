Este repositorio proporciona una solución completa para configurar un Pipeline de integración y entrega continua (CI/CD) utilizando Jenkins, Prometheus, Grafana y SonarQube. La infraestructura se despliega mediante Docker Compose, facilitando la orquestación y gestión de los servicios involucrados.

## Contenido del Repositorio

- **Jenkins**: Servidor de automatización que permite construir, probar y desplegar aplicaciones.
- **Prometheus**: Sistema de monitoreo y base de datos de series temporales, utilizado para recopilar métricas de los servicios.
- **Grafana**: Plataforma de análisis y visualización de métricas, que se integra con Prometheus para mostrar datos en tiempo real.
- **SonarQube**: Plataforma para inspección continua de la calidad del código, que detecta errores, vulnerabilidades y malas prácticas.

## Requisitos Previos

- Docker y Docker Compose instalados en el sistema.

## Instalación y Puesta en Marcha

1. **Clonar el repositorio**:

   ```bash
   git clone https://github.com/fcongedo/jenkins-prometheus-grafana-sonarqube.git
   cd jenkins-prometheus-grafana-sonarqube
   ```

2. **Construir y levantar los servicios**:

   ```bash
   docker-compose up --build -d
   ```

   Este comando descargará las imágenes necesarias, construirá los contenedores y levantará los servicios en segundo plano.

## Acceso a las Interfaces Web

- **Jenkins**: [http://localhost:8080](http://localhost:8080)
- **Prometheus**: [http://localhost:9090](http://localhost:9090)
- **Grafana**: [http://localhost:3000](http://localhost:3000)
- **SonarQube**: [http://localhost:9000](http://localhost:9000)

**Credenciales por defecto**:

- Usuario: `admin`
- Contraseña: `admin`

**Nota**: Es recomendable cambiar las credenciales por defecto después del primer inicio de sesión para garantizar la seguridad.

## Integración de Servicios

- **Jenkins**: Configurado con los plugins necesarios para interactuar con SonarQube y enviar métricas a Prometheus.
- **Prometheus**: Recopila métricas de Jenkins y SonarQube, permitiendo el monitoreo del rendimiento y la salud de los servicios.
- **Grafana**: Proporciona dashboards preconfigurados para visualizar las métricas recopiladas por Prometheus.
- **SonarQube**: Analiza el código fuente para identificar problemas de calidad y seguridad, integrándose con Jenkins para proporcionar informes en las compilaciones.

## Dashboards de Grafana

Este repositorio incluye dashboards preconfigurados para Grafana que permiten visualizar:

- **Rendimiento y salud de Jenkins**: Utilizando el dashboard "Jenkins: Performance and Health Overview" (ID: 9964).
- **Métricas del sistema**: Utilizando el dashboard "Node Exporter Full" (ID: 11074).
- **Análisis de SonarQube**: Utilizando el dashboard "Sonarqube - Analysis Dashboard" (ID: 17642).

Para importar estos dashboards, accede a Grafana, selecciona "Importar dashboard" e ingresa el ID correspondiente.

## Detener los Servicios

Para detener y eliminar los contenedores creados, ejecuta:

```bash
docker-compose down
```

Este comando detendrá todos los servicios y liberará los recursos asociados.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o envía un pull request con mejoras, correcciones o nuevas funcionalidades.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.

---