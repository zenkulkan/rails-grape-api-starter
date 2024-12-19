# frozen_string_literal: true

module Users
  class RegistrationService < ApplicationService
    attr_reader :params

    # Initialize with necessary dependencies (e.g., models, objects, params, other services)
    def initialize(params)
      @params = params
    end

    # Perform the core business logic
    def call
      user = User.new(params)

      return user if user.save

      raise Errors::UserError::InvalidParams
    end
  end
end
