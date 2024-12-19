# frozen_string_literal: true

module Constants
  USER_ROLES = { user: 0, admin: 1 }.freeze
  TOEKN_EXPIRES_IN = 1.month.from_now.freeze
  DEFAULT_HTTP_STATUS = 200
  DEFAULT_MAIL_FROM = 'info@mail.com'
  USER_MAILER = {
    welcome: {
      subject: 'Welcome to Our App!'
    }
  }.freeze
end
