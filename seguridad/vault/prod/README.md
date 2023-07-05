# Vault production server

## Uso

Funciona igual que el comun con la diferencia que esta en production mode, para ejecutarlo solo hacer:

```bash
docker compose up
```

Luego ir a [localhost:8200](http://127.0.0.1:8200) con el token **admin**

## Error en caso de que falle el script

En caso de que el script falle hay que borrar el volume de *prod_vault* para que lo cree de nuevo

```bash
docker volume rm prod_vault
```
