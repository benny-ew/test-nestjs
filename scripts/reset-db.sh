#!/bin/bash
# filepath: /home/benny/test-nestjs/scripts/reset-db.sh

# Exit on error
set -e

echo "⚠️ WARNING: This will reset the database and all data will be lost! ⚠️"
echo "Press Ctrl+C to cancel or Enter to continue..."
read

echo "🗑️ Dropping database tables..."
npm run typeorm -- schema:drop -d src/config/typeorm.config.ts

echo "🗄️ Running migrations..."
npm run migration:run

echo "✅ Database has been reset successfully!"
