# Makefile to manage dataplatfom docker images

# VARIABLES
# -----------------------------------------------------------------------------
SPARK_APP_NAME=create_schema.py

# Create docker network if not exists
# -----------------------------------------------------------------------------
.PHONY: create-network
create-network:
	@docker network inspect data-network > /dev/null 2>&1 || docker network create --driver bridge data-network
	@echo "Network data-network created"

# compose up with all services
# -----------------------------------------------------------------------------
.PHONY: compose-up-all
compose-up-all: create-network
	@docker compose --profile spark --profile trino --env-file .env up -d
	@docker ps

# compose up with 1 spark worker
# -----------------------------------------------------------------------------
.PHONY: compose-up-spark1
compose-up-spark1: create-network
	@docker compose --profile spark --env-file .env up -d
	@docker ps

# compose up with 2 spark workers
# -----------------------------------------------------------------------------
.PHONY: compose-up-spark2
compose-up-spark2: create-network
	@docker compose --profile spark up -d --scale spark-worker=2
	@docker ps

# compose up with 3 spark workers
# -----------------------------------------------------------------------------
.PHONY: compose-up-spark3
compose-up-spark3: create-network
	@docker compose --profile spark up -d --scale spark-worker=3
	@docker ps

# compose up with certbot
# -----------------------------------------------------------------------------
.PHONY: compose-up-certbot
compose-up-certbot: create-network
	@chmod +x ./certbot/docker-entrypoint.sh
	@docker compose --env-file .env --profile certbot up -d
	@docker ps

# compose up with 1 trino workers
# -----------------------------------------------------------------------------
.PHONY: compose-up-trino
compose-up-trino: create-network
	@docker compose --profile trino up -d --scale trino-worker=1
	@docker ps

# compose down then remove network
# -----------------------------------------------------------------------------
.PHONY: compose-down
compose-down:
	@docker compose --profile trino --profile spark --profile certbot down
	@docker network rm data-network
	@echo "Network data-network removed"

# Spark master submit
# -----------------------------------------------------------------------------
.PHONY: spark-submit
spark-submit:
	@docker exec -it spark-master bash -c "cd /opt/spark-apps && spark-submit --master spark://spark-master:7077 $(SPARK_APP_NAME)"

# Backup OLTP, Minio and Hive metastore data
# -----------------------------------------------------------------------------
.PHONY: backup
backup: pg-dump-oltp pg-dump-metastore
	@mkdir -p backup
	@sudo apt install zip unzip
	@zip -r backup/volumes.zip volumes
	@echo "Backup completed"

# Postgres dump OLTP data
# -----------------------------------------------------------------------------
.PHONY: pg-dump-oltp
pg-dump-oltp:
	@pg_dump --dbname="postgresql://adventureworks:adventureworks@localhost:6543/adventureworks" -Fc -f /root/e2e-data-platform/docker/backup/adventureworks.bak

# Postgres dump Metastore data
# -----------------------------------------------------------------------------
.PHONY: pg-dump-metastore
pg-dump-metastore:
	@pg_dump --dbname="postgresql://hive:hive@localhost:5433/metastore" -Fc -f /root/e2e-data-platform/docker/backup/metastore.bak

# Initialize adventureworks database
.PHONY: init-db
init-db:
	@cd ../adw14 && chmod +x adw14data.sh && ./adw14data.sh
	@cd ../docker

# Clean temp data
# -----------------------------------------------------------------------------
.PHONY: clean
clean: compose-down
	@rm -r volumes

# Clean Adw14 data
# -----------------------------------------------------------------------------
.PHONY: clean-adw14
clean-adw14:
	@rm -r ../adw14/data
	@rm -r ../adw14/AdventureWorks-oltp-install-script.zip

# Clean all
# -----------------------------------------------------------------------------
.PHONY: clean-all
clean-all: clean clean-adw14
	@docker rmi $(docker images -q)
	@docker system prune -f

# Help
# -----------------------------------------------------------------------------
.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  create-network    		Create docker network if not exists"
	@echo "  compose-up-all    		Compose up with all services"
	@echo "  compose-up-spark1 		Compose up with 1 spark worker"
	@echo "  compose-up-spark2 		Compose up with 2 spark workers"
	@echo "  compose-up-spark3 		Compose up with 3 spark workers"
	@echo "  compose-up-certbot		Compose up with certbot"
	@echo "  compose-up-trino  		Compose up with 1 trino workers"
	@echo "  compose-down      		Compose down all services then remove network"
	@echo "  spark-submit      		Spark master submit"
	@echo "  backup            		Backup OLTP, Minio and Hive metastore data"
	@echo "  init-db           		Initialize adventureworks database"
	@echo "  clean             		Clean temp data"
	@echo "  clean-all        		Clean all"
	@echo "  help              		Show this help message"
	@echo ""
