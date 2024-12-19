# frozen_string_literal: true

module Helpers
  module AuthorizationHelper
    extend Grape::API::Helpers
    include Pundit::Authorization

    def authorize(record, query = nil)
      super(record, query)
    rescue Pundit::NotAuthorizedError
      error!('Unauthorized', 403)
    end

    def pundit_user
      current_user
    end

    def authenticate!
      error!('Unauthorized', 401) unless current_user
    end

    def current_user
      @current_user ||= begin
        authorization_token = headers['Authorization']&.split(' ')&.last
        return unless authorization_token

        token = Token.find_by(token: authorization_token)
        return token.user if token && !token.expired?

        nil
      end
    end
  end
end
