import jenkins.model.*
import hudson.security.*
import hudson.plugins.sonar.*
import hudson.util.Secret

// Configuración del Security Realm
def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("admin", "admin")
instance.setSecurityRealm(hudsonRealm)

// Configuración de la estrategia de autorización
def strategy = new hudson.security.FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)

// Configuración de credenciales para SonarQube
def domain = Domain.global()
def credentialsStore = instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()
def credentials = new com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl(
    com.cloudbees.plugins.credentials.CredentialsScope.GLOBAL,
    "SonarQube_jenkins",  // ID
    "Admin credentials",  // Descripción
    "admin",              // Usuario
    "administrator"       // Contraseña
)
credentialsStore.addCredentials(domain, credentials)

// Configuración de SonarQube
def desc = instance.getDescriptor("hudson.plugins.sonar.SonarGlobalConfiguration")
def sonarServers = new ArrayList<SonarInstallation>()
sonarServers.add(
    new SonarInstallation(
        "SonarQube_Server", // Nombre
        "http://localhost:9000", // URL del servidor
        "SonarQube_jenkins", // ID de las credenciales
        "", "", "", new ArrayList<>()
    )
)
desc.setInstallations(sonarServers.toArray(new SonarInstallation[0]))
desc.save()

// Configuración de métricas (ejemplo con Jenkins Metrics Plugin)
// Puedes agregar configuraciones adicionales según sea necesario.

def themeManagerConfig = instance.getExtensionList(jenkins.plugins.ui.theme.ThemeManager.class)[0]
themeManagerConfig.setDisableUserThemes(true)
themeManagerConfig.setTheme("dark")

// Guardar cambios
instance.save()
