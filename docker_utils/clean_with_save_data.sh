#bin/bash

set -e
cd ..
docker exec -t $(docker-compose ps -q db) pg_dump -U yourusername --data-only yourdatabase > ./docker_utils/data_only_backup.sql
sudo docker-compose down --volumes --remove-orphans
