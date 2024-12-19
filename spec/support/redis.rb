# frozen_string_literal: true

RSpec.configure do |config|
  config.after(:each) do
    keys = $redis.keys
    $redis.del(keys) if keys.any?
  end
end
