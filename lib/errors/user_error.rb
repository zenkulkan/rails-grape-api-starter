# frozen_string_literal: true

class Errors
  class UserError
    InvalidParams = Errors.define('errors.users.invalid_params', 422)
  end
end
