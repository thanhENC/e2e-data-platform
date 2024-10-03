# FROM python:3.10-slim-buster

# WORKDIR /usr/dbt

# COPY . .
# COPY profiles.yml /usr/.dbt/profiles.yml

# RUN pip install --upgrade pip
# RUN pip install dbt -r requirements.txt

# # # Default entry point to run dbt docs commands
# ENTRYPOINT ["sh", "-c", "dbt deps && dbt docs generate"]

# ======================================================
FROM python:3.10-slim-buster

WORKDIR /usr/dbt

COPY entrypoint.sh /usr/docker/entrypoint.sh

# # Default entry point to run dbt docs commands
ENTRYPOINT ["sh", "-c", "chmod +x /usr/docker/entrypoint.sh && /usr/docker/entrypoint.sh"]