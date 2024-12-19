# frozen_string_literal: true

class PaginationMetaService < ApplicationService
  attr_reader :collection, :total

  def initialize(collection, total = nil)
    @collection = collection
    @total = total
  end

  def call
    {
      current_page: page,
      per_page: per_page,
      total_count: total_count,
      total_pages: total_pages
    }
  end

  private

  def total_count
    return total if total

    collection.respond_to?(:total_count) ? collection.total_count : collection.count
  end

  def per_page
    collection.respond_to?(:limit_value) ? collection.limit_value : nil
  end

  def page
    collection.respond_to?(:current_page) ? collection.current_page : nil
  rescue Kaminari::ZeroPerPageOperation
    1
  end

  def total_pages
    collection.respond_to?(:total_pages) ? collection.total_pages : nil
  rescue Kaminari::ZeroPerPageOperation
    1
  end
end
