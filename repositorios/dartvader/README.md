# Dartvader

Este repositorio incluye `unpub` y utilidades relacionadas.

## Levantar con Docker Compose

Desde `repositorios/dartvader`:

```bash
docker compose up -d --build
```

Servicios levantados:

- `mongo`: base de datos MongoDB.
- `unpub`: servidor privado de paquetes en `http://localhost:4000`.

Parar y borrar contenedores:

```bash
docker compose down
```