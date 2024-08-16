# chmod +x start_dockercompose.sh

#!/bin/bash

# Stop and remove any existing containers
docker compose down

# Start the MinIO server
docker compose up -d

# Print the status of the containers
docker compose ps