#!/bin/bash

echo "Creating dump of the source database..."
export $(grep -v '^#' ../.env | xargs)
sudo pg_dump -h $DB_HOST -U $DB_USER -d $DB_NAME -p $DB_PORT --data-only -f ./data_only_backup.sql
