FROM python:3.10-slim-buster

WORKDIR /usr

COPY . .
COPY profiles.yml /usr/.dbt/profiles.yml

RUN pip install --upgrade pip
RUN pip install dbt -r requirements.txt

# # Default entry point to run dbt docs commands
ENTRYPOINT ["sh", "-c", "dbt deps && dbt docs generate"]