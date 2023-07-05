
# Debezium

> Imagen con ejemplo de debezium

## Puertos

* **dozzle**: 9090
* **kafka-ui**: 9000

## Paginas

[Video explicativo](https://www.youtube.com/watch?v=YZRHqRznO-o&ab_channel=CodewithIrtiza)

## Pasos para probarlo

Levantar el entorno
```bash
docker compose up
```
Creacion de la tabla
```bash
docker exec -it postgres psql -U postgres -c "CREATE TABLE students(id int primary key, name varchar(30));"
```

Crear el conector de debezium
```bash
curl --location --request POST 'localhost:8083/connectors/' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "connector-postgres",
    "config": {
        "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
        "plugin.name": "pgoutput",
        "database.hostname": "postgres",
        "database.port": "5432",
        "database.user": "postgres",
        "database.password": "postgres",
        "database.dbname": "postgres",
        "database.server.name": "postgres",
        "table.include.list": "public.students"
    }
}'
```

Insertar datos en la tabla
```bash
docker exec -it postgres psql -U postgres -c "INSERT INTO public.students VALUES(random() * 100, 'asd');"
```

Se debe ver como **kafkacat** comienza a mostrar json de lo que debezium va guardando en kafka, se pueden ver en [este link de dozzle](http://localhost:9090/) en el tab de kafkacat

