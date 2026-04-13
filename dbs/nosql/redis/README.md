# Redis

Imagen de redis, contiene scripts para levantar el compose del server y del cliente

![alt text](img/redis.png)

## Puertos

* **DB**: 6379
* **GUI**: 5540

## Gui

Para la interfas grafica solo hay que agregar la base de datos con la url:

```bash
redis://default@redis:6379
```

## Volumes

* **data**: con los datos guardados por redis

## Scripts

* Cliente bash de Redis

    ```bash
    ./redis-cli.sh
    ```

## Paginas

[Imagen docker hub](https://hub.docker.com/_/redis)
