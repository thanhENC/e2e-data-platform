# Define variables
COMPOSE_FILE=docker-compose.keycloak.yaml
ENV_FILE=keycloak.env

# Docker Compose commands
up:
	@echo "Starting Keycloak services..."
	docker compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) up -d
	docker ps

down:
	@echo "Stopping Keycloak services..."
	docker compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) down

logs:
	@echo "Showing logs for Keycloak services..."
	docker compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) logs -f

restart: down up

# Help command to list available targets
help:
	@echo "Available commands:"
	@echo "  make up       - Start Keycloak services"
	@echo "  make down     - Stop Keycloak services"
	@echo "  make logs     - Show logs for Keycloak services"
	@echo "  make restart  - Restart Keycloak services"
