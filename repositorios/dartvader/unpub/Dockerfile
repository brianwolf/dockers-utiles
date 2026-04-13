FROM dart:3.10-sdk AS build

WORKDIR /app

COPY pubspec.yaml pubspec.lock* ./
RUN dart pub get

COPY . .
RUN dart compile exe "bin/unpub.dart" -o "/app/bin/unpub"

FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=build /app/bin/unpub /app/bin/unpub

RUN mkdir -p /data/unpub-packages

EXPOSE 4000

ENTRYPOINT ["/app/bin/unpub"]
CMD ["--host", "0.0.0.0", "--port", "4000", "--database", "mongodb://mongo:27017/dart_pub"]
