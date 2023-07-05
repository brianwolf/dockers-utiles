VOLUME_NAME ?= consul_consul
IMAGE ?= consul:1.9.9


install i:
	docker-compose pull
	docker-compose up -d


stop s:
	docker-compose down


remove r:
	docker-compose down
	docker volume rm -f ${VOLUME_NAME}
	docker rmi -f ${IMAGE}


compose-logs l:
	docker-compose logs -f

