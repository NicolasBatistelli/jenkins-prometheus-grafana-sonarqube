import jenkins.model.*
import hudson.security.*
import hudson.plugins.sonar.*
import hudson.util.Secret
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*

// Configuración del Security Realm
def instance = Jenkins.getInstance()
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("admin", "admin")
instance.setSecurityRealm(hudsonRealm)

// Configuración de la estrategia de autorización
def strategy = new hudson.security.FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)

// Configuración de credenciales para SonarQube (usuario y contraseña)
def domain = Domain.global()
def credentialsStore = instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()
def sonarUserPassCredentials = new UsernamePasswordCredentialsImpl(
    CredentialsScope.GLOBAL,
    "SonarQube_jenkins",  // ID de las credenciales
    "Admin credentials for SonarQube",  // Descripción
    "admin",              // Usuario
    "administrator"       // Contraseña
)
credentialsStore.addCredentials(domain, sonarUserPassCredentials)

// Configuración de SonarQube
def desc = instance.getDescriptor("hudson.plugins.sonar.SonarGlobalConfiguration")
def sonarServers = new ArrayList<SonarInstallation>()
sonarServers.add(
    new SonarInstallation(
        "SonarQube_Server", // Nombre
        "http://localhost:9000", // URL del servidor (ajusta según tu configuración)
        "SonarQube_jenkins", // ID de las credenciales
        "", "", "", new ArrayList<>()
    )
)
desc.setInstallations(sonarServers.toArray(new SonarInstallation[0]))
desc.save()

// Configuración del tema oscuro (opcional)
def themeManagerConfig = instance.getExtensionList(jenkins.plugins.ui.theme.ThemeManager.class)[0]
themeManagerConfig.setDisableUserThemes(true)
themeManagerConfig.setTheme("dark")

// Guardar cambios
instance.save()
