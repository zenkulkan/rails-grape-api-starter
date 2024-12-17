source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '~> 7.1.3'
gem 'rack-cors', :require => 'rack/cors'

# Database
gem 'pg', '~> 1.4'
# Active Record for models
gem 'activerecord', '~> 7.1'

# Active Storage for attachments
gem 'activestorage'

# Authentication
gem 'devise'

# Fast JSON API for response formatting
gem 'fast_jsonapi'

# Redis for caching
gem 'redis', '~> 5.3'
gem 'redis-namespace', '~> 1.11'
gem 'redis-objects', '~> 1.7'
# Background jobs
gem 'sidekiq', '~> 7.3', '>= 7.3.6'
gem 'sidekiq-cron', '~> 2.0', '>= 2.0.1'
gem 'sidekiq-unique-jobs', '~> 8.0', '>= 8.0.10'

# Optional gems for monitoring and error tracking
gem 'newrelic_rpm', '~> 8.10', require: false  # New Relic APM (Application Performance Monitoring)
gem 'sentry-rails', '~> 5.7', require: false    # Sentry error tracking

# Pagination
gem 'kaminari'

# authorization
gem 'pundit'

# for external request
gem 'httparty'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# grape api
gem 'grape'
gem 'grape-swagger'
gem 'rswag-ui'

# Testing

# Beautiful, performant feature flags for Ruby and Rails.
gem 'flipper'
gem 'flipper-active_record'
gem 'flipper-ui'

group :test do
  gem 'simplecov', require: false
end

group :development do
  gem 'letter_opener_web'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers' # For convenient model testing
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
  gem 'webmock'
  gem 'pry', '~> 0.14.2'
  gem 'rspec-sidekiq', '~> 5.0'
  gem 'dotenv-rails'
end
