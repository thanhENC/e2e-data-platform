PROJECT=dakdak

init-env:
	@python3 -m venv .venv

install: init-env
	. .venv/bin/activate && \
	pip install -r requirements.txt

init-prj: init-env install
	@. .venv/bin/activate && \
	rm -rf dakdak && \
	dagster project scaffold --name ${PROJECT} && \
	cd dakdak && \
	pip install -e ".[dev]" && \
	dagster dev

clean:
	@rm -rf ${PROJECT}
	@rm -rf .venv