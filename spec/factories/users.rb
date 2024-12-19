FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }

    trait :admin do
      role { :admin }
    end

    # Sequences for generating unique values
    # sequence(:email) { |n| "user#{n}@example.com" }

    # Associations (assuming Example belongs_to :user)
    # association :user

    # trait :with_long_name do
    #   name { Faker::Lorem.sentence(word_count: 5) }
    # end

    # Transient attributes
    # transient do
    #   with_addresses { false } # Default value
    # end

    # Callbacks for performing actions after creating or building the example
    # after(:build) do |example|
    #   # Example: Set a default value for an attribute
    #   user.created_at ||= Time.zone.now
    # end

    # After create callback using the transient attribute
    # after(:create) do |example, evaluator|
    #   if evaluator.with_addresses
    #     create_list(:addeesses, 3, example: example)
    #   end
    # end
  end
end
