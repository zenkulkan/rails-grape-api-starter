# frozen_string_literal: true

module Users
  class TokenService < ApplicationService
    def self.generate_token_for_user(user)
      20.times do
        token = SecureRandom.hex(32)
        expires_at = Constants::TOEKN_EXPIRES_IN

        next if Token.exists?(token: token) # Check for uniqueness

        user.tokens.create!(token: token, expires_at: expires_at)
        break token # Exit the loop and return the unique token
      end
    end

    def self.revoke_token(token)
      token_record = Token.find_by(token: token)
      token_record&.update(expires_at: 1.second.ago) if token_record # Mark as expired
    end
  end
end
