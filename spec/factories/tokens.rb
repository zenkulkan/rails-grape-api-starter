FactoryBot.define do
  factory :token do
    user { nil }
    token { Faker::Internet.device_token }
    expires_at { '2024-09-05 08:51:14' }
  end
end
