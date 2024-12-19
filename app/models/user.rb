class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_confirmation_of :password
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: Devise.email_regexp }

  has_many :tokens, dependent: :destroy

  enum role: Constants::USER_ROLES
end
