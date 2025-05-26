#!/bin/bash
# filepath: /home/benny/test-nestjs/scripts/start-with-migrations.sh

# Exit on error
set -e

echo "🔄 Checking environment..."
NODE_ENV=${NODE_ENV:-development}
echo "📊 Current environment: $NODE_ENV"

# Wait for database to be ready (important in containerized environments)
echo "⏳ Waiting for database to be ready..."
# Add a small sleep to ensure database is fully ready
sleep 5

if [ "$NODE_ENV" = "production" ]; then
  echo "🚀 Production mode: Running migrations and starting application..."
  
  echo "🗄️ Running database migrations..."
  # In production we use compiled JS files
  node ./dist/node_modules/typeorm/cli.js migration:run -d ./dist/src/config/typeorm.config.js
  
  echo "🚀 Starting application..."
  node dist/main
else
  echo "🗄️ Running database migrations..."
  npm run migration:run
  
  echo "🛠️ Development mode: Starting application..."
  npm run start:prod
fi
