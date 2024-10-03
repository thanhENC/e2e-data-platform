#!/bin/bash
# working directory: /usr/dbt
# source code directory: /usr/src/dbt

echo "=============================================================="
echo "      Copying DBT project to /usr/dbt from /usr/src/dbt"
echo "  Copying the profiles.yml file to /usr/.dbt/profiles.yml"

cp -r /usr/src/dbt /usr
# cp -f /usr/dbt/profiles.yml /usr/.dbt/profiles.yml # I set working directory is /usr/dbt, so I don't need to copy profiles.yml file

echo "=============================================================="
echo "                   Install required packages"
pip install dbt -r requirements.txt

echo "=============================================================="
echo "          Running dbt deps to install dependencies"
echo "          Running dbt docs to generate documentation"
dbt deps &&
dbt docs generate

echo "=============================================================="
echo "              Finished setting up DBT project"