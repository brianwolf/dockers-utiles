import random
import time

from kafka import KafkaProducer

KAFKA_URL = 'localhost:9092'
KAFKA_TOPIC = 'topico'

producer = KafkaProducer(
    bootstrap_servers=[KAFKA_URL]
)

while True:

    key = f"{random.randrange(999)}".encode()
    value = f"{random.randrange(999)}".encode()

    producer.send(topic=KAFKA_TOPIC, key=key, value=value)
    producer.flush()
    print(f"enviado -> key: {key} | value: {value}")

    time.sleep(4)
