JAFFLE_SHOP_GITHUB = https://github.com/dbt-labs/jaffle-shop-generator
JAFFLE_SHOP_GITHUB_FOLDER = jaffle-shop-generator
NO_YEAR_SAMPLE = 1

# Main makefile ==============================================
# 1. Generate data
gen_data: clone_github init_gendata_env gen_jaffle_shop_data copy_jaffle_shop_data clean_jaffle_shop_data

# 2. Docker compose datalake
datalake_up:
	cd docker; \
	docker compose -f docker-compose.datalake.yaml up -d
	docker ps

datalake_down:
	cd docker; \
	docker compose -f docker-compose.datalake.yaml down

# Generate data phase ========================================

clone_github:
	cd data; \
	git clone $(JAFFLE_SHOP_GITHUB)

init_gendata_env:
	cd data/$(JAFFLE_SHOP_GITHUB_FOLDER); \
	python3 -m venv .venv; \
	. .venv/bin/activate; \
	pip install -r requirements.txt; \
	pip install jafgen

gen_jaffle_shop_data:
	cd data/$(JAFFLE_SHOP_GITHUB_FOLDER); \
	. .venv/bin/activate; \
	jafgen $(NO_YEAR_SAMPLE) --pre raw

copy_jaffle_shop_data:
	cp -r data/$(JAFFLE_SHOP_GITHUB_FOLDER)/jaffle-data/ data/

clean_jaffle_shop_data:
	rm -rf data/$(JAFFLE_SHOP_GITHUB_FOLDER)

# Import data to postgres ===================================
connect_db:
	sudo apt install postgresql; \
	psql -h localhost -U postgres




