# Base image
FROM ubuntu:24.04 As development

# Install Node.js
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source files
COPY . .

# Build the application with TypeORM config
RUN npm run build 

# Make scripts executable
RUN chmod +x ./scripts/*.sh

# Production image
FROM ubuntu:24.04 As production

# Install Node.js
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set NODE_ENV
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy built application and necessary files from development stage
COPY --from=development /usr/src/app/dist ./dist
COPY --from=development /usr/src/app/scripts ./scripts

# Add wget for healthcheck
RUN apt-get update && apt-get install -y wget && apt-get clean && rm -rf /var/lib/apt/lists/*

# Make scripts executable
RUN chmod +x ./scripts/*.sh

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 CMD ./scripts/healthcheck.sh

# Expose API port
EXPOSE 3003

# Start the application with migrations
CMD ["./scripts/start-with-migrations.sh"]