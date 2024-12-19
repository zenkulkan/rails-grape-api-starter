# frozen_string_literal: true

class UsersQuery
  def self.call(scope: User.all, params: {})
    new(scope, params).call
  end

  # Apply filtering based on parameters
  def call
    # Example filter: Filter by status if provided
    # scope = scope.where(actice: @params[:actice]) if @params[:active].present?

    # Example filter: Filter by created_at range if provided
    if params[:start_date].present? && params[:end_date].present?
      @scope = @scope.where(created_at: params[:start_date]..params[:end_date])
    end
    # count of total before paginated data
    total = @scope.count

    @scope = @scope.page(params[:pagination][:page]).per(params[:pagination][:per_page]) if params[:pagination].present?
    # ... Add more filters as needed

    [@scope, total]
  end

  private

  attr_reader :params, :pagination

  # Initialize with optional parameters and default scope
  def initialize(scope, params)
    @scope = scope
    @params = params
    @pagination = params[:pagination]
    raise ArgumentError if @pagination.present? && (@pagination[:page] < 1 || @pagination[:per_page] < 1)
  end
end
