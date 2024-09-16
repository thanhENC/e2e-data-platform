# Makefile to manage dataplatfom docker images

# VARIABLES
# -----------------------------------------------------------------------------
SPARK_APP_NAME=test_meta.py

# Create docker network if not exists
# -----------------------------------------------------------------------------
.PHONY: create-network
create-network:
	@docker network inspect data-network > /dev/null 2>&1 || docker network create --driver bridge data-network
	@echo "Network data-network created"

# compose up with 1 spark worker
# -----------------------------------------------------------------------------
.PHONY: compose-up
compose-up: create-network
	@docker compose --env-file .env up -d
	@docker ps

# compose up with 2 spark workers
# -----------------------------------------------------------------------------
.PHONY: compose-up-2
compose-up-2: create-network
	@docker compose up -d --scale spark-worker=2
	@docker ps

# compose up with 3 spark workers
# -----------------------------------------------------------------------------
.PHONY: compose-up-3
compose-up-3: create-network
	@docker compose up -d --scale spark-worker=3
	@docker ps

# compose down then remove network
# -----------------------------------------------------------------------------
.PHONY: compose-down
compose-down:
	@docker compose down
	@docker network rm data-network
	@echo "Network data-network removed"

# Spark master submit
# -----------------------------------------------------------------------------
.PHONY: spark-submit
spark-submit:
	@docker exec -it spark-master bash -c "cd /opt/spark-apps && spark-submit --master spark://spark-master:7077 $(SPARK_APP_NAME)"

# Initialize adventureworks database
.PHONY: init-db
init-db:
	@cd ../adw14 && chmod +x adw14data.sh && ./adw14data.sh
	@cd ../docker

# Clean temp data
# -----------------------------------------------------------------------------
.PHONY: clean
clean: compose-down
	@rm -r volume

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
	@echo "  create-network    Create docker network if not exists"
	@echo "  compose-up        Compose up with 1 spark worker"
	@echo "  compose-up-2      Compose up with 2 spark workers"
	@echo "  compose-up-3      Compose up with 3 spark workers"
	@echo "  compose-down      Compose down then remove network"
	@echo "  spark-submit      Spark master submit"
	@echo "  init-db           Initialize adventureworks database"
	@echo "  clean             Clean temp data"
	@echo "  clean-all         Clean all"
	@echo "  help              Show this help message"
	@echo ""
