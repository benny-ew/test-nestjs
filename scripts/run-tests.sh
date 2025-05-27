#!/bin/bash
# filepath: /home/benny/test-nestjs/scripts/run-tests.sh

# Run unit tests
echo "Running unit tests..."
npm run test

# Run test coverage
echo "Running test coverage..."
npm run test:cov

# Run e2e tests
echo "Running e2e tests..."
npm run test:e2e -- --forceExit
