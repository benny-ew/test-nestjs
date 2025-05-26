#!/bin/bash
# filepath: /home/benny/test-nestjs/scripts/setup-dev.sh

# Exit on error
set -e

echo "🛠️ Setting up development environment..."

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
  echo "📦 Installing dependencies..."
  npm install
fi

# Check if database is available (adjust if needed)
if [[ -n "$DB_HOST" && -n "$DB_PORT" ]]; then
  echo "🔄 Checking database connection..."
  timeout 5 bash -c "cat < /dev/null > /dev/tcp/${DB_HOST}/${DB_PORT}" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "✅ Database is up and running."
  else
    echo "⚠️  Can't connect to database at ${DB_HOST}:${DB_PORT}. Starting service..."
    docker-compose up -d postgres
  fi
fi

# Run migrations
echo "🗄️ Running database migrations..."
npm run migration:run

echo "🚀 Setup complete! You can now start the application with:"
echo "   npm run start:dev"
