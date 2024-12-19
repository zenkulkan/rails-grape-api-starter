# frozen_string_literal: true

module Helpers
  module PaginationHelper
    def meta(collection, total = nil)
      PaginationMetaService.call(collection, total)
    end
  end
end
