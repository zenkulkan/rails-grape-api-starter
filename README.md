# Rails Grape API starter Project - Main Branch

This is Rails Grape API starter Project, serving as the foundation for the Grape API. It contains the core configurations, models, services, and other shared components.

## Setup

1. Clone the repository
2. Run `bundle install`
3. Create the `.env` file (see below)
4. Create the database: `rails db:create`
5. Run migrations: `rails db:migrate`

## Environment Variables

| Variable              | Comment                                             |
|-----------------------|-----------------------------------------------------|
| `DB_HOST`             | Database host (default: `localhost`)                |
| `DB_USERNAME`         | Database username                                     |
| `DB_PASSWORD`         | Database password                                     |
| `DB_NAME`             | Database name                                        |
| `DB_PORT`             | Database port (default: 5432 for PostgreSQL)        |
| `RAILS_MAX_THREADS`   | Maximum number of threads for the Rails application |
| `REDIS_URL`           | Redis URL for Sidekiq and caching                   |
| `SENTRY_DSN`          | Sentry DSN for error tracking                        |
| `BLOCK_HTTP_TRACE`    | Disable HTTP TRACE method (true/t/1 to disable)    |
| `NEW_RELIC_APP_NAME`  | New Relic application name                          |
| `NEW_RELIC_LICENSE_KEY`| New Relic license key                              |
| `RACK_TIMEOUT_SERVICE_TIMEOUT` | Timeout for Rack::Timeout (default: 15 seconds) |
| `S3_ACCESS_KEY_ID`    | AWS S3 access key ID                                |
| `S3_SECRET_ACCESS_KEY`| AWS S3 secret access key                            |
| `S3_REGION`           | AWS S3 region                                        |
| `S3_BUCKET`           | AWS S3 bucket name                                   |

## Project Structure
```
.
├── app/
│   ├── api/
│   ├── jobs/
│   ├── mailers/
│   ├── models/
│   ├── queries/
│   ├── services/
│   └── ... (other potential directories)
├── config/
│   ├── initializers/
│   │   └── sidekiq.rb
│   ├── environments/
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── storage.yml
│   └── ... (other potential configuration files)
├── db/
│   ├── migrate/
│   └── ... (other potential database-related directories)
├── lib/
│   └── tasks/
├── spec/
│   ├── api/
│   ├── factories/
│   ├── jobs/
│   ├── models/
│   ├── queries/
│   ├── services/
│   ├── support/
│   │   └── factory_bot.rb
│   ├── spec_helper.rb
│   └── rails_helper.rb
├── Gemfile
├── Gemfile.lock
├── README.md
└── ... (other potential files, such as .gitignore, Procfile, etc.)
```

**Key Features**

* **Core Configurations:** Includes essential settings for database, Active Storage, Sidekiq, CORS, caching, etc.
* **RSpec and Factory Bot:** Set up for testing with RSpec, Factory Bot, and Shoulda Matchers.
* **Optional Integrations:** Includes New Relic and Sentry as optional gems for monitoring and error tracking.
