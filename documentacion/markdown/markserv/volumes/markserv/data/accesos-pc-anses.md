#  Accesos PC - Anses - José

### [Indice](indice)

* [Credenciales PC](#credenciales_pc)  

- [Jboss](#jboss)
  - [Jboss desarrollo](#jboss_desa)
  - [Jboss producción](#jboss_prod)
- [Jenkins](#jenkins)
  - [Credenciales](#jenkins_credenciales)
  - [Tareas Jenkins SADIL](#jenkins_sadil)
  - [Tareas Jenkins DICTAMENES](#jenkins_dictamenes)
- [Redmine](#redmine)
  - [URL Redmine SADIL](#redmine_sadil)
  - [Ejemplos de peticiones de despliegue](#ejemplo_peticiones)
    - [Configuración de datasources en Jboss](#peticion_datasources)
    - [Configuración de Jboss (nuevo)](#peticion_jboss)
    - [Configuración tareas de Jenkins](#peticion_jenkins)
- [NAS](#nas)



[Volver página principal](README.md)

------



## <a name=credenciales_pc href=#indice>Credenciales PC</a> (20/11/2020)

* Username: e649490
* Password: Leafnoise12
* Nombre equipo: DGIITSISDESA81
* IP: 10.86.30.63



## <a name=jboss href=#indice>Jboss</a>

#### <a name=jboss_desa href=#indice>Jboss desarrollo</a>

- URL: http://10.8.15.179:9990
- Credenciales:
  - Username: admin
  - Password: anses123



#### <a name=jboss_prod href=#indice>Jboss producción</a>

- URL: http://ansesdomcont7.anses.gov.ar:9990
- Credenciales:
  - Username: e649490
  - Password: Leafnoise12



## <a name=jenkins href=#indice>Jenkins</a>

#### <a name=jenkins_credenciales href=#indice>Credenciales</a>

- Username: e716376
- Password: Leafnoise28



#### <a name=jenkins_sadil href=#indice>Tareas Jenkins SADIL</a>

- SADIL-CONFIG-DATASOURCE (Configurar bases de datos)    
- SADIL-CONFIG-DESA (Configurar variables de ambiente)
- SADIL-DESA-DEPLOY (Deploy en desarrollo)	
- SADIL-MAKE-RELEASE (Build del aplicativo)



#### <a name=jenkins_dictamenes href=#indice>Tareas Jenkins DICTAMENES</a>

- DICTAMENES-CONFIG-DATASOURCE (Configurar base de datos)
- DICTAMENES-CONFIG-DEPLOY (Configurar de variables de ambiente)	
- DICTAMENES-CONFIG-VARS (Deploy en desarrollo)
- DICTAMENES-MAKE-RELEASE (Build del aplicativo)



## <a name=redmine href=#indice>Redmine</a>

#### <a name=redmine_sadil href=#indice>Redmine peticiones SADIL</a>

- URL: https://ansesalm.anses.gov.ar/redmine/projects/zmsadilbatch/issues



#### <a name=ejemplo_peticiones href=#indice>Ejemplos de peticiones para despliegues</a>

##### <a name=peticion_datasources href=#indice>Configuración de datasources en Jboss</a>

```
Buenas días, se necesita realizar las siguientes tareas para el despliegue del nuevo proceso batch de SADIL , y derivar a quién corresponda:

1- Crear y configurar los datasources para DB2 y SQLServer en el servidor Jboss 7.1 de producción para el proceso de SADIL BATCH con los siguientes datos:

jndi-name=java:/sqlserverDS
jndi-name=java:/SadilDS

En el PROFILE "sadil-batch-profile"

2- Otorgar a los objetos de DB2 y SQLServer los permisos correspondientes para su uso desde el Jboss 7.1, detallados en Paginas 8-14, DOCUMENTO DE DESPLIEGUE V01

3 - Generar el WAR del artefacto con la tarea de Jenkins de desarrollo SADIL-MAKE-RELEASE. El WAR se guarda en ansesalm.anses.gov.ar/nexus, un ejemplo de url completo para descargarlo es el siguiente: http://ansesalm.anses.gov.ar/nexus/content/repositories/maven-anses-releases/io/moorea/sadil/0.0.185/sadil-0.0.185.war.

Adjunto documentación de despliegue:
\\ansesnas\Sistemas\Sistemas\DOCUMENTACION SISTEMAS ENTORNO ABIERTO\ZM - SADIL - MIGRACION BATCH\SNR\DOCUMENTACION

PUNTO 1 Y 2 DERIVAR a Seguridad de Aplicaciones

Muchas gracias! Saludos.-
```



##### <a name=peticion_jboss href=#indice>Configuración de Jboss (nuevo - desde cero)</a>

```
Buenos días, necesito realizar las siguientes tareas y derivar a quien corresponda:

Paso 1)

Configurar en un servidor Jboss 7.1 de producción lo siguiente (Pagina 3, Configuracion Servidor V01):
Para que la aplicación Java funcione correctamente, el servidor debe tener acceso a consultar los servicios SOAP en las siguientes URL:
• Digiweb: http://webservices.anses.gov.ar/DigitalizacionServicios/DigitalizacionServicio.asmx?wsdl
• Servicio de apropiación de CUIL: http://webservices.anses.gov.ar/ApropiacionCUIL/ApropiacionCuilServicio.asmx?wsdl
• Servicio de obra social: http://webservices.anses.gov.ar/Anses.Prissa.Carpeta.Invalidez.Servicio/ObraSocialWS.asmx?wsdl
• Servicio de envío de mails: http://webservices.anses.gov.ar/checkmail/enviarmail.asmx?wsdl
• Servicio de SNR: http://webservices.anses.gov.ar/Anses.Prissa.Carpeta.Invalidez.Servicio.SNR/ServicioSNR.asmx?wsdl

Paso 2)

Además Jenkins debe tener acceso al controlador del servidor (puerto 9999), caso contrario no se podrán ejecutar los despliegues, la configuración de los datasources o la configuración de las variables de ambiente.

Paso 3)

También deberán crearse:
• Un Server Group con el nombre: “sadil-server-group”
• Un Server con el nombre:"sadil-1"
• Un Profile con el nombre:”sadil-batch-profile”

Importante:Crear únicamente una instancia.

Paso 4)

También deberan realizarse las siguiente modificaciones (Pagina 14, Configuracion Servidor V01):

Dentro del servidor se debe crear una estructura de directorios donde se guardarán los archivos que la aplicación descarga durante su ejecución, tal estructura es la siguiente:
• /home/jboss/.carpeta_invalidez/gestor_archivos_snr
    o /home/jboss/.carpeta_invalidez/gestor_archivos_snr/ok
    o /home/jboss/.carpeta_invalidez/gestor_archivos_snr/error
    o /home/jboss/.carpeta_invalidez/gestor_archivos_snr/pdf
    o /home/jboss/.carpeta_invalidez/gestor_archivos_snr/tmp
    o /home/jboss/.carpeta_invalidez/gestor_archivos_snr/xml

La aplicación Java debe tener permisos de ejecución, lectura y escritura de estos directorios.

Paso 5)

El servidor debe contar con los drivers necesarios para conectarse a DB2 y SQLServer para que ambas base de datos puedan funcionar correctamente (Pagina 14, Configuracion Servidor V01).

Adjunto documentación de despliegue:
\\ansesnas\Sistemas\Sistemas\DOCUMENTACION SISTEMAS ENTORNO ABIERTO\ZM - SADIL - MIGRACION BATCH\SNR\DOCUMENTACION

Muchas gracias, saludos !
```



##### <a name=peticion_jenkins href=#indice>Configuración tareas de Jenkins</a>

```
Buenas tardes, a continuación dejo especificadas las variables a modificar:

1-Para el caso de la tarea de SADIL-CONFIG-PROD: Utilizar las variables que se encuentran en el DOCUMENTO DE DESPLIEGUE V01 (Página 5), cito aquí:

CONFIG = {
"sadil.batch.activar":"true",
"sadil.batch.modo.prueba":"false",
"sadil.snr.dir.zip":"/home/jboss/.carpeta_invalidez/gestor_archivos_snr",
"sadil.soap.envio.mail.destinatarios":"agportnoi@anses.gov.ar;ejmlicatacaruso@anses.gov.ar;farodriguez@anses.gov.ar;mrgiacoboni@anses.gov.ar;gnverga@anses.gov.ar;gsgonzalez@anses.gov.ar;mhcallegari@anses.gov.ar;lmaguero@anses.gov.ar;ezequielcarpena@anses.gov.ar;jrluchini@anses.gov.ar",
“sadil.soap.envio.mail.control.destinatarios”:”agportnoi@anses.gov.ar;jrluchini@anses.gov.ar”,
“sadil.cron.service.batch.lote”:”00 00 17 * * *”,
“sadil.digiweb.system”:”ZM-SADIL”,
“sadil.cantidad.lotes.procesar”:”1”,
"sadil.soap.envio.mail.url":"http://webservices.anses.gov.ar/checkmail/enviarmail.asmx?wsdl", "sadil.soap.servicio.apropiacion.url":"http://webservices.anses.gov.ar/ApropiacionCUIL/ApropiacionCuilServicio.asmx?wsdl",
"sadil.soap.servicio.obra.social.url":"http://webservices.anses.gov.ar/Anses.Prissa.Carpeta.Invalidez.Servicio/ObraSocialWS.asmx?wsdl",
"sadil.soap.servicio.snr.url":”http://webservices.anses.gov.ar/Anses.Prissa.Carpeta.Invalidez.Servicio.SNR/ServicioSNR.asmx?wsdl”,
“sadil.soap.servicio.digitalizacion.url”:”http://webservices.anses.gov.ar/DigitalizacionServicios/DigitalizacionServicio.asmx?wsdl”
}

En la propiedad "sadil.snr.dir.zip" completar con la nueva ruta creada para guardar los archivos descargados. Recordar que debe existir la ruta de directorios finales estipulados en el documento Configuración Servidor V01 en la página 13.

Además en esta misma tarea cambiar las siguientes propiedades definidas ahí mismo en la pestaña "Ejecutar" por las creadas en Jboss 7.1 de producción:
• CONTROLLER
• SERVER_GROUP
• HOST
• SERVER
• USER
• PASS

2-En la tarea SADIL-PROD-DEPLOY modificar las propiedades por las equivalentes del Jboss de producción, y agregar los valores detallados a continuación para las demás:

• CONTROLLER
• SERVER_GROUP
• DEPLOYMENT_NAME=sadil.war
• GROUP_ID=io.moorea
• ARTIFACT_ID=sadil
• USER
• PASS

3- Para la tarea SADIL-CONFIG-DATASOURCE:
• Utilizar los valores de conexión creados por el área de base de datos

Saludos y muchas gracias! Cualquier consulta estoy a disposición.
```



## <a name=nas href=#indice>NAS</a>

#### Ruta NAS SADIL

```
\\ansesnas\Sistemas\Sistemas\DOCUMENTACION SISTEMAS ENTORNO ABIERTO\ZM - SADIL - MIGRACION BATCH\SNR
```

#### Ruta NAS DICTAMENES

```
\\ansesnas\Sistemas\Sistemas\DOCUMENTACION SISTEMAS ENTORNO ABIERTO\ZM - SADIL - MIGRACION BATCH\SRT
```

