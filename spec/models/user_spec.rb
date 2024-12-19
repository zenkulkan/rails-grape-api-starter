require 'rails_helper'

RSpec.describe User, type: :model do
  # Basic validations
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('test@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }

  # Enum validations
  it { should define_enum_for(:role).with_values(user: 0, admin: 1) }

  # Associations
  it { should have_many(:tokens).dependent(:destroy) }

  # Other model tests (add more as needed based on your model's logic)
  describe '#admin?' do
    it 'returns true if the user is an admin' do
      user = create(:user, :admin)
      expect(user.admin?).to be true
    end

    it 'returns false if the user is not an admin' do
      user = create(:user)
      expect(user.admin?).to be false
    end
  end
end
