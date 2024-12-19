# frozen_string_literal: true

module Helpers
  module ResponseHelper
    extend Grape::API::Helpers
    def render(data = {}, status = nil)
      status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a?(Symbol)
      status status if status
      present data
    end
  end
end
