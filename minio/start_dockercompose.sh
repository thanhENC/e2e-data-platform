# chmod +x start_dockercompose.sh

# docker run -p 9000:9000 -p 9001:9001 --name minio -v ~/minio/data:/data -e "MINIO_ROOT_USER=ROOTNAME" -e "MINIO_ROOT_PASSWORD=123456789" quay.io/minio/minio server /data --console-address ":9001" 

#!/bin/bash

# Stop and remove any existing containers
docker compose down

# Start the MinIO server
docker compose up -d

# Print the status of the containers
docker compose ps