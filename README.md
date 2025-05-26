<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg" alt="Donate us"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow" alt="Follow us on Twitter"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

A NestJS application with PostgreSQL database integration for task management. This project includes:

- Task entity with CRUD operations
- Docker and Docker Compose setup
- PostgreSQL database integration
- pgAdmin for database management
- TypeORM migrations for database schema management
- Health endpoints for application monitoring
- Environment variable configuration


## Environment Configuration

Create a `.env` file in the root directory with the following variables:

```bash
# Application Configuration
PORT=3003

# Environment
NODE_ENV=development

# Database Configuration
DB_HOST=postgres
DB_PORT=5432
DB_USERNAME=postgres
DB_PASSWORD=postgres_password
DB_NAME=nestjs_db
```

## Running with Docker

```bash
# Build and start all services
$ docker-compose up -d

# Access the API at http://localhost:3003
# Access Swagger documentation at http://localhost:3003/api
```

## Running locally

```bash
# One-step development setup (installs dependencies, checks database, runs migrations)
$ npm run setup

# Or do the steps manually:

# Install dependencies
$ npm install

# Run database migrations
$ npm run migration:run

# Development mode
$ npm run start

# Watch mode
$ npm run start:dev

# Production mode
$ npm run start:prod
```

## Database Migrations

This project uses TypeORM migrations to manage the database schema. For more details, see [MIGRATIONS.md](MIGRATIONS.md).

```bash
# Generate a new migration
$ npm run migration:generate -- src/migrations/YourMigrationName

# Create an empty migration
$ npm run migration:create -- src/migrations/CustomMigration

# Run all pending migrations
$ npm run migration:run

# Revert the latest migration
$ npm run migration:revert
```

## API Endpoints

| Method | Endpoint        | Description           | Request Body Example                                              |
|--------|-----------------|--------------------|-----------------------------------------------------------------|
| GET    | /tasks          | Get all tasks         | N/A                                                           |
| GET    | /tasks/:id      | Get a specific task   | N/A                                                           |
| POST   | /tasks          | Create a new task     | `{ "title": "New Task", "description": "Task details" }`      |
| PUT    | /tasks/:id      | Update a task         | `{ "title": "Updated Task", "status": "IN_PROGRESS" }`        |
| DELETE | /tasks/:id      | Delete a task         | N/A                                                           |

## Run tests

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e
```

## Deployment

When you're ready to deploy your NestJS application to production, there are some key steps you can take to ensure it runs as efficiently as possible. Check out the [deployment documentation](https://docs.nestjs.com/deployment) for more information.

If you are looking for a cloud-based platform to deploy your NestJS application, check out [Mau](https://mau.nestjs.com), our official platform for deploying NestJS applications on AWS. Mau makes deployment straightforward and fast, requiring just a few simple steps:

```bash
$ npm install -g @nestjs/mau
$ mau deploy
```

With Mau, you can deploy your application in just a few clicks, allowing you to focus on building features rather than managing infrastructure.




## License

Nest is [MIT licensed](https://github.com/nestjs/nest/blob/master/LICENSE).
