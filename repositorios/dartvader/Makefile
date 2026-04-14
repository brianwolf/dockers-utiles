# dev-web:
# 	cd unpub_web &&\
# 	dart pub global activate webdev 2.7.4 &&\
# 	dart pub global activate webdev_proxy 0.1.1 &&\
# 	dart pub global run webdev_proxy serve -- --auto=refresh --log-requests

# dev-api:
# 	cd unpub &&	dart run build_runner watch

# build:
# 	cd unpub_web &&\
# 	dart pub global activate webdev 2.7.4 &&\
# 	dart pub global run webdev build
# 	dart unpub/tool/pre_publish.dart
# 	dart format **/*.dart

run:
	docker compose up -d --build

stop:
	docker compose down

token:
	dart run unpub_auth/bin/unpub_auth.dart login
	dart run unpub_auth/bin/unpub_auth.dart get