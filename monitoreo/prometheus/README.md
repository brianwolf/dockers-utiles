
# Prometheus

> Imagen de prometheus, grafana y pushgateway

![alt text](img/header.png)

## Puertos

* **Grafana**: 3000
* **Prometheus**: 9090
* **Pushgateway**: 9091

## Accesos Grafana

* **user**: admin
* **pass**: admin

## Volumes

* **prometheus**: contiene la configiguracion para prometheus

## Documentacion

[Imagen docker hub](https://hub.docker.com/_/Sonarqube)

## Comandos Prometheus

```javascript
{job=~"scale_data", __name__=~"job_last_success_unixtime"}
```
