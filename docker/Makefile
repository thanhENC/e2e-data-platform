COMPOSE_FILE=docker-compose.nginx.yaml
ENV_FILE=.env

# Docker Compose commands
up:
	@echo "Starting Nginx services..."
	docker compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) up -d
	docker ps

down:
	@echo "Stopping Nginx services..."
	docker compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) down

logs:
	@echo "Showing logs for Nginx services..."
	docker compose --env-file $(ENV_FILE) -f $(COMPOSE_FILE) logs -f

restart: down up

# Help command to list available targets
help:
	@echo "Available commands:"
	@echo "  make up       - Start Nginx services"
	@echo "  make down	 - Stop Nginx services"
	@echo "  make logs	 - Show logs for Nginx services"
	@echo "  make restart  - Restart Nginx services"
