#!/bin/bash
# filepath: /home/benny/test-nestjs/scripts/migrations/generate-migration.sh

# Check if name is provided
if [ -z "$1" ]; then
  echo "Error: Migration name is required"
  echo "Usage: $0 <migration-name>"
  exit 1
fi

# Generate timestamp for migration name
TIMESTAMP=$(date +%s%3N)
NAME="$1"

# Create migration file
npm run migration:generate -- src/migrations/${TIMESTAMP}-${NAME}
