docker compose down

docker build . --tag extending_airflow:latest

docker compose up -d --no-deps --build