project_name = theweekdays_adw

###################################

init: ## Initialize dbt project
	@dbt init $(project_name)

run: ## Run dbt project
	@dbt run

utils: ## Install dbt-utils
	@dbt deps

run_theweekdays:
	dbt run --project-dir ./ --profiles-dir ./ --full-refresh

run_silver:
	dbt run --project-dir ./silver --profiles-dir ./ --full-refresh

run_gold:
	dbt run --project-dir ./gold --profiles-dir ./ --full-refresh

run_all:
	make run_bronze && make seed && make run_external && make run_silver && make run_gold

run_external:
	dbt run-operation --project-dir ./silver stage_external_sources

install_deps:
	dbt deps --project-dir ./silver

seed:
	dbt seed --project-dir ./bronze --profiles-dir ./ --full-refresh
	
docs:
	dbt docs generate --project-dir ./silver --profiles-dir ./ && dbt docs serve --port 8081 --project-dir ./silver --profiles-dir ./

select:
	dbt run --profiles-dir ./silver --select $(script)

test:
	dbt test --profiles-dir ./silver