# -------------------------------------------------------------
# BUILD
# -------------------------------------------------------------
FROM dart:3.10-sdk AS build

WORKDIR /app

COPY pubspec.yaml pubspec.lock* ./
RUN dart pub get

COPY . .
RUN dart compile exe "bin/dartvader.dart" -o "/app/bin/dartvader"

# -------------------------------------------------------------
# FINAL IMAGE
# -------------------------------------------------------------

FROM debian:bookworm-slim

# RUN apt-get update \
#     && apt-get install -y --no-install-recommends ca-certificates \
#     && rm -rf /var/lib/apt/lists/*

WORKDIR /app/bin/

COPY --from=build /app/bin/dartvader .

RUN mkdir -p /data/dartvader-packages

EXPOSE 4000

CMD ["/bin/bash", "-c", "/app/bin/dartvader --host 0.0.0.0 --port 4000 --database $UNPUB_MONGO_URI"]
