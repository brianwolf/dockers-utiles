# NFS Server

> Imagen de nfs server


## Puertos

* **nfs**: 2049

## Uso

Montar la unidad
```bash
sudo mount -t nfs localhost:/ /tmp/nfs
```

Desmontar
```bash
sudo umount -l /tmp/nfs
```

Verificar
```bash
df -h
```
