# Build docker image then run docker compose

# Build docker image
build:
	docker build . --no-cache --tag extending_airflow:latest

# docker compose up -d --no-deps --build airflow-webserver airflow-scheduler
# Run docker compose
run:
	docker compose up -d --no-deps --build