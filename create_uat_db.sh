#!/bin/bash

# Check if the argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <database_name>"
  exit 1
fi

# Load environment variables from uat.env file
if [ ! -f .env ]; then
  echo ".env file not found!"
  exit 1
fi

# Export the variables from uat.env file
export $(grep -v '^#' .env | xargs)

# Check if the necessary variables are set
if [ -z "$UAT_CONTAINER_NAME" ] || [ -z "$UAT_POSTGRES_USER" ] || [ -z "$UAT_POSTGRES_DB" ]; then
  echo "UAT_CONTAINER_NAME, UAT_POSTGRES_USER, and UAT_POSTGRES_DB must be set in the .env file."
  exit 1
fi

# Assign the argument to a variable
db_to_create="$1"

# Execute the Docker Compose command
docker compose -f docker-compose-uat.yml exec -T "$UAT_CONTAINER_NAME" psql -U "$UAT_POSTGRES_USER" -d "$UAT_POSTGRES_DB" -c "CREATE DATABASE $db_to_create;"

if [ $? -eq 0 ]; then
  echo "Database $db_to_create created successfully."
else
  echo "Failed to create database $db_to_create."
fi
