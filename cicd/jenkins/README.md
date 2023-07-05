
# Jenkins

> Imagen con Jenkins para realizar pruebas, usa la version **lts**, pero existe un alpine

![alt text](img/jenkins.png)

## Puertos

* **Jenkins**: 8080

## Accesos

* **USER**: admin
* **PASS**: la contraseña aparece al levantarse Jenkins por primera vez o se puede obtener ejecutando este comando:

```bash
docker compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

## Volumes

* **jenkins**: contiene los datos guardados por jenkins

## Paginas

[Imagen docker hub](https://hub.docker.com/r/jenkins/jenkins/)
