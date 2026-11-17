.PHONY: up down restart logs auth clean help wireguard
.SILENT:

ENV_FILE ?= .env
DOCKER_COMPOSE := $(shell docker compose version >/dev/null 2>&1 && echo "docker compose" || echo "docker-compose")
CYAN := $(shell printf '\033[36m')
RESET := $(shell printf '\033[0m')

.DEFAULT_GOAL := help

help: ## Muestra esta ayuda con los comandos disponibles
	@echo "Uso: make [comando]"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(CYAN)%-15s$(RESET) %s\n", $$1, $$2}'

up: ## Construye las imágenes desde cero y levanta los contenedores
	$(DOCKER_COMPOSE) up -d --build

auth: ## Conecta la consola a FortiVPN para ingresar el código 2FA (Salir con Ctrl+P y luego Ctrl+Q)
	@echo "Ingresá el token 2FA. Cuando veas 'Tunnel is up and running', salí con: Ctrl+P seguido de Ctrl+Q"
	docker attach fortivpn-client

down: ## Detiene y elimina los contenedores (conserva el estado de Tailscale)
	$(DOCKER_COMPOSE) down

restart: ## Reinicia ambos contenedores
	$(DOCKER_COMPOSE) restart

logs: ## Muestra los logs en tiempo real de ambos servicios
	$(DOCKER_COMPOSE) logs -f

clean: ## Elimina contenedores, imágenes, estado de Tailscale y limpieza total
	$(DOCKER_COMPOSE) down -v --rmi all

wireguard: ## Muestra la configuracion de coneccion para Wireguard
	cat wireguard-config/peer_paraguay/peer_paraguay.conf