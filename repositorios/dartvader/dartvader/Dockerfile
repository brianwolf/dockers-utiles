FROM dart:3.10-sdk AS build

WORKDIR /app

COPY pubspec.yaml pubspec.lock* ./
RUN dart pub get

COPY . .
RUN dart compile exe "bin/dartvader.dart" -o "/app/bin/dartvader"

FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=build /app/bin/dartvader /app/bin/dartvader

RUN mkdir -p /data/dartvader-packages

EXPOSE 4000

ENTRYPOINT ["/app/bin/dartvader"]
CMD ["--host", "0.0.0.0", "--port", "4000", "--database", "mongodb://mongo:27017/dart_pub"]
