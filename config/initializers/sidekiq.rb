# frozen_string_literal: true

require 'sidekiq/middleware/i18n'
require 'sidekiq/web'
require 'sidekiq/cron/web'

Sidekiq.logger.level = Logger::WARN if Rails.env.test?

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') { 'redis://localhost:6379/0' } }
  config.error_handlers << proc do |ex, context|
    # Log the error or send it to an error tracking service
    Rails.logger.error "Sidekiq error: #{ex}\nContext: #{context}"
  end

  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end

  config.server_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Server
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') { 'redis://localhost:6379/0' } }

  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end
end

schedule_file = 'config/schedule.yml'
Sidekiq::Cron::Job.load_from_hash(YAML.load_file(schedule_file)) if File.exist?(schedule_file) && Sidekiq.server?
