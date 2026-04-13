# Wireguard

El frontend no funciona por lo que se deja un script para descargar la config de la vpn

![alt text](docs/img/WireGuard-VPN-2022.jpeg)

## Uso

1. Configurar el docker compose

    * SERVERURL: IP publica, se puede obtener de [cual-es-mi-ip](https://www.cual-es-mi-ip.net/)
    * PEERS: Cantidad de usuarios que se pueden conectar

2. Levantar el docker compose

3. Ejecutar el script pasandole el numero de usuario que se quiere, por ejemplo

    ```bash
    . download-config.sh 1
    ```

4. Se crea una carpeta que contiene el archivo **.config** usado para conectarse desde una PC y el **.png** para desde el celular

## Puertos

* **server**: 5000

## Accesos

* **URL**: 0.0.0.0:5000
* **USER**: admin
* **PASS**: admin

## Videos

[Configurar guarguar](https://www.youtube.com/watch?v=G_Pv9XEzfUY&ab_channel=PeladoNerd)

## Paginas

[Docker](https://hub.docker.com/r/linuxserver/wireguard)
[Repo front](https://github.com/ngoduykhanh/wireguard-ui)
[Client GUI](https://github.com/UnnoTed/wireguird)
[Client Android](https://play.google.com/store/apps/details?id=com.wireguard.android&hl=es&gl=US&pli=1)
