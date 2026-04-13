from kafka import KafkaConsumer

KAFKA_URL = 'localhost:9092'
KAFKA_TOPIC = 'topico'

consumer = KafkaConsumer(
    'topico',
    bootstrap_servers=[KAFKA_URL],
    auto_offset_reset='earliest'
)

for message in consumer:
    print(
        f"recibido => topico: {message.topic} | key: {message.key} | value: {message.value}")
