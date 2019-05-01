require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(email: "test@example.com", first_name: "John", last_name: "Doe", password: "asdf123", password_confirmation: "asdf123") }
  describe 'Creation' do
    it 'can be created' do
      expect(user).to be_valid
    end

    it 'cannot create user without a first_name and last_name' do
      user.update_attributes(first_name: nil, last_name: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'Custom name methods' do
    it 'has a full name method that combines first and last name' do
      expect(user.full_name).to eq("DOE, JOHN")
    end
  end
end
