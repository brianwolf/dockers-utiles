# Nginx

> Ejemplo de Nginx

![alt text](docs/img/nginx.png)

## Uso

* Ejecutar `docker-compose up`
* Ingresar en [esta url](https://localhost), al recargar la pagina varias veces el nodo debe cambiar

## Configuracion

* En el archivo `./docker-env/ambiente.env` se encuentran las variables de entorno para docker de nginx

## Volumes

* **nginx**: tiene un script para iniciar nginx con varibles de ambiente
* **nodo-1**: tiene el index.html del server de apache
* **nodo-2**: tiene el index.html del server de apache

La forma de ejecutar dentro del docker es mediante un script, esto es para que nginx tome las variables de ambiente del archivo de config

## Paginas

[Nginx](https://hub.docker.com/_/nginx)
[Httpd](https://hub.docker.com/_/httpd)
