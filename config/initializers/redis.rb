# frozen_string_literal: true

require 'redis'
require 'redis/objects'

$redis = Redis.new(
  url: ENV.fetch('REDIS_URL') { 'redis://localhost:6379/0' }
)

namespace = ['wow-rails', Rails.env].join(':')
$redis_content = Redis::Namespace.new(namespace + '_contents', redis: $redis)
