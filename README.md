# Rails Grape API starter Project

**Purpose:** This is showcases how to build APIs using the Grape framework, which offers a more DSL-like and flexible approach to defining API endpoints. It leverages models, service objects, and query objects for data handling and business logic. `fast_jsonapi` is used for serialization, and Grape Swagger is used for generating API documentation. Pundit is used for authorization.

## Setup

1. Clone the repository
2. Run `bundle install`
3. Create the `.env` file (see below)
4. Create the database: `rails db:create`
5. Run migrations: `rails db:migrate`

## API Documentation

* **Tool:** Grape Swagger
* **Access:** Visit `/api-docs` (e.g., `http://localhost:3000/api-docs`) after starting the server.

## Authentication

* **Mechanism:** Custom token-based authentication (using `token` in the `Token` model)
* **Token Generation:** `TokenService` (located in `app/services/token_service.rb`) is used to generate and manage authentication tokens
* **Authentication Helper:**  The `AuthorizationHelper` in `app/api/v1/helpers/authorization_helper.rb` provides the `authenticate!` and `current_user` methods for handling authentication in Grape API endpoints.

## Authorization

* **Tool:** Pundit
* **Policies:** Authorization policies are defined in the `app/policies` directory.
* **Integration:** Pundit is integrated into Grape using the `AuthorizationHelper` in `app/api/helpers/authorization_helper.rb`.

## Setup and Usage

The `app/api/base.rb` file serves as the entry point for the Grape API. API versions are organized in subdirectories within `app/api` (e.g., `v1/`). Define your API endpoints in files within these versioned directories. Use `fast_jsonapi` serializers to format responses and Grape Swagger annotations to generate documentation.


## Branch Structure
```
rails-grape-api-starter
├── app/
│   ├── api/
│   │   ├── helpers/
│   │   │   └── serialization_helper.rb
│   │   │   └── pagination_helper.rb
│   │   │   └── authorization_helper.rb
│   │   │   └── [helper files]
│   │   └── v1/
│   │   │   └── base.rb
│   │   │   └── users.rb
│   │   │   └── [API endpoint files]
│   │   ├── api.rb
│   ├── models/
│   │   └── [Model files]
│   ├── queries/
│   │   └── [Query object files]
│   ├── serializers/
│   │   └── [Serializer files]
│   ├── services/
│   │   └── [Service object files]
│   ├── lib/
│   │   └── errors.rb
│   │   └── errors
│   │   │   └── user_error.rb
│   │   └── [lib files]
│   └── ...
├── config/
│   └── routes.rb
├── db/
│   └── migrate/
├── spec/
│   ├── api/
│   │   └── v1/
│   │       └── [API endpoint specs]
│   ├── factories/
│   │   └── [Factory files]
│   ├── queries/
│   │   └── [Query object specs]
│   ├── jobs/
│   │   └── [Job object specs]
│   ├── services/
│   │   └── [Service object specs]
│   └── ...
└── README.md
```

## Testing

* **Framework:** RSpec
* **Test Data:** FactoryBot
* **Spec Locations:**
    * API Endpoints: `spec/api/v1/`
    * Models: `spec/models/`
    * Queries: `spec/queries/`
    * Services: `spec/services/`
    * Jobs/Workers: `spec/jobs/`


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
| `SENTRY_DSN`          | Sentry DSN for error tracking (optional)             |
| `BLOCK_HTTP_TRACE`    | Disable HTTP TRACE method (true/t/1 to disable)    |
| `NEW_RELIC_APP_NAME`  | New Relic application name (optional)               |
| `NEW_RELIC_LICENSE_KEY`| New Relic license key (optional)                   |
| `RACK_TIMEOUT_SERVICE_TIMEOUT` | Timeout for Rack::Timeout (default: 15 seconds) |
| `S3_ACCESS_KEY_ID`    | AWS S3 access key ID (for Active Storage)           |
| `S3_SECRET_ACCESS_KEY`| AWS S3 secret access key (for Active Storage)        |
| `S3_REGION`           | AWS S3 region (for Active Storage)                  |
| `S3_BUCKET`           | AWS S3 bucket name (for Active Storage)             |
| `MAILER_HOST_URL`     | Base URL for your application (used in email links) |
| `MAILER_ADDRESS`      | SMTP server address                                  |
| `MAILER_PORT`         | SMTP port (typically 587 or 465)                    |
| `MAILER_DOMAIN`       | Domain for your email provider                       |
| `MAILER_USER_NAME`    | Username for your email account                      |
| `MAILER_PASSWORD`     | Password for your email account                      |
| `MAILER_AUTHENTICATION`| Authentication method (e.g., 'plain', 'login')       |

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
