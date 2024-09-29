# Build docker image then run docker compose

# Build docker image
build:
	docker build . --no-cache --tag extending_airflow:latest
	echo "Docker image built"

# docker compose up -d --no-deps --build airflow-webserver airflow-scheduler
# Run docker compose
compose-init: build compose-up

compose-up:
	@docker compose up -d
	@docker ps

compose-down:
	@docker compose down
	@docker ps
	@rm -r data