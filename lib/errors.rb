# frozen_string_literal: true

class Errors < StandardError
  attr_reader :status_code, :locale_key

  def initialize(locale_key = nil, status_code = 500, **kwargs)
    @locale_key = locale_key
    @status_code = status_code
    super(I18n.t(locale_key, **kwargs))
  end

  def self.define(locale_key, status_code)
    new(locale_key, status_code)
  end
end
