import * as fs from 'fs';
import * as path from 'path';

/**
 * This script copies the TypeORM config from src to dist after build
 * to ensure the migrations can find the config file in production.
 */
async function copyConfig() {
  try {
    // Get src and dist paths
    const srcPath = path.join(process.cwd(), 'src', 'config', 'typeorm.config.ts');
    const distPath = path.join(process.cwd(), 'dist', 'src', 'config');
    
    // Create dist directory if it doesn't exist
    if (!fs.existsSync(distPath)) {
      fs.mkdirSync(distPath, { recursive: true });
    }
    
    // Copy the file
    fs.copyFileSync(
      srcPath, 
      path.join(distPath, 'typeorm.config.js')
    );
    
    console.log('✅ Successfully copied TypeORM config to dist folder');
  } catch (error) {
    console.error('❌ Failed to copy TypeORM config:', error);
    process.exit(1);
  }
}

// Execute the function
copyConfig();
