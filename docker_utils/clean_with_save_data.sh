#bin/bash
set -e
cd ..
export $(grep -v '^#' .env | xargs)
docker exec -t $(docker-compose ps -q db) pg_dump -U $DB_USER --data-only $DB_NAME > ./docker_utils/data_only_backup.sql
docker-compose down --volumes --remove-orphans
docker rmi axewood666/quiz_app:latest