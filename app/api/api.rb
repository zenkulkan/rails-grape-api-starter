# frozen_string_literal: true

require 'grape-swagger'

class API < Grape::API
  mount ::V1::Base
end
