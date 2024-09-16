#!/bin/bash

echo "=============================================================="
echo "Downloading AdventureWorks OLTP database and installing it into PostgreSQL..."
echo "=============================================================="

# Download AdventureWorks-oltp-install-script.zip
wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks-oltp-install-script.zip

# Update package lists and install (or update) unzip, ruby, and postgresql-client-common
echo "=============================================================="
echo "Updating package lists and installing (or updating) unzip, ruby, and postgresql-client..."
echo "=============================================================="
sudo apt update
sudo apt install -y unzip
sudo apt install -y ruby
sudo apt-get install -y postgresql-client

# Unzip the downloaded file into the /data directory
echo "=============================================================="
echo "Unzipping the downloaded file into the /data directory..."
echo "=============================================================="
unzip AdventureWorks-oltp-install-script.zip -d ./data

# Optional: Check if the unzip process was successful
if [ -d "/data" ]; then
    echo "Download and unzip completed successfully into /data."
else
    echo "Something went wrong. Please check the script."
fi

# Download install adventureworks database script
echo "=============================================================="
echo "Downloading install.sql script..."
echo "=============================================================="
wget https://raw.githubusercontent.com/lorint/AdventureWorks-for-Postgres/master/install.sql -P ./data

# Download update csv files script
echo "=============================================================="
echo "Downloading update_csvs.rb script..."
echo "=============================================================="
wget https://raw.githubusercontent.com/lorint/AdventureWorks-for-Postgres/master/update_csvs.rb -P ./data

# connect to OLTP postgres database
echo "=============================================================="
echo "Connecting to OLTP postgres database..."
echo "=============================================================="
set -a
source ../docker/.env
set +a

# Modify the CSV files to make them work with PostgreSQL
cd ./data
ruby update_csvs.rb

# Create the OLTP database and tables
export OLTP_DB_CONNECTION_STRING=postgresql://$OLTP_DB_USER:$OLTP_DB_PASSWORD@localhost:$OLTP_DB_PORT_EXPOSE/$OLTP_DB_NAME
psql $OLTP_DB_CONNECTION_STRING -f install.sql

# Optional: Check if the database was created successfully
if [ $? -eq 0 ]; then
    echo "Database created successfully."
else
    echo "Something went wrong. Please check the script."
fi