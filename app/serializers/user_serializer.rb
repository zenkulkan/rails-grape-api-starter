# frozen_string_literal: true

class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email
  #  :token
  # ... other attributes you want to include in the response

  # Include associated if needed like below
  # has_many :tokens
  # attribute :token do  |record|
  #   record.tokens.empty? ? '' : record.tokens.last.token
  # end
end
