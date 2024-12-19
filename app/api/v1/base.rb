# frozen_string_literal: true

require 'grape-swagger'

class V1::Base < Grape::API
  prefix 'api/v1'
  format :json
  content_type :json, 'application/json; charset=utf-8'

  rescue_from ActiveRecord::RecordNotFound do |e|
    error!({ error: 'Record not found' }, 404)
  end

  rescue_from StandardError do |e|
    # if there are more complex error respose update it here or lib/errors.rb
    error!({ error: e.message }, e&.status_code || 422)
  end

  helpers ::Helpers::SerializationHelper
  helpers ::Helpers::AuthorizationHelper
  helpers ::Helpers::PaginationHelper
  helpers ::Helpers::ResponseHelper

  mount V1::Logs
  mount V1::Users

  unless Rails.env.production?
    # This enables Swagger documentation generation
    add_swagger_documentation(
      api_version: 'v1',
      mount_path: '/api-docs',
      info: {
        title: 'WOW API',
        description: 'API description '
      },
      hide_documentation_path: true,
      hide_api_documentation_path: true
    )
  end
end
