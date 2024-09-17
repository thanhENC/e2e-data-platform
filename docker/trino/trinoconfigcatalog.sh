#!/bin/bash
set -e

# List of required environment variables
required_vars=("OLTP_DB_USER" "OLTP_DB_PASSWORD" "OLTP_DB_NAME" "OLTP_DB_PORT" "OLTP_DB_HOST" "HIVE_METASTORE_URI" "MINIO_ENDPOINT" "MINIO_ACCESS_KEY" "MINIO_SECRET_KEY" "MINIO_SSL_ENABLED")

# Check if environment variables exist
missing_vars=false
for var in "${required_vars[@]}"; do
  if [[ -z "${!var}" ]]; then
    echo "Error: Environment variable $var is not set."
    missing_vars=true
  fi
  echo "Environment variable $var is set."
done

# If any required variable is missing, exit the script
if [ "$missing_vars" = true ]; then
  echo "Exiting script due to missing environment variables."
  exit 1
fi

# All required environment variables are set, proceed with sed
sed -e "s|\${OLTP_DB_USER}|${OLTP_DB_USER}|g" \
    -e "s|\${OLTP_DB_PASSWORD}|${OLTP_DB_PASSWORD}|g" \
    -e "s|\${OLTP_DB_NAME}|${OLTP_DB_NAME}|g" \
    -e "s|\${OLTP_DB_PORT}|${OLTP_DB_PORT}|g" \
    -e "s|\${OLTP_DB_HOST}|${OLTP_DB_HOST}|g" \
    /etc/trino-template/postgres.properties.template > /etc/trino/catalog/postgres.properties

echo "Configuration file generated successfully!"

sed -e "s|\${HIVE_METASTORE_URI}|${HIVE_METASTORE_URI}|g" \
    -e "s|\${MINIO_ENDPOINT}|${MINIO_ENDPOINT}|g" \
    -e "s|\${MINIO_ACCESS_KEY}|${MINIO_ACCESS_KEY}|g" \
    -e "s|\${MINIO_SECRET_KEY}|${MINIO_SECRET_KEY}|g" \
    -e "s|\${MINIO_SSL_ENABLED}|${MINIO_SSL_ENABLED}|g" \
    /etc/trino-template/delta.properties.template > /etc/trino/catalog/delta.properties

# Start Trino server
exec /usr/lib/trino/bin/run-trino