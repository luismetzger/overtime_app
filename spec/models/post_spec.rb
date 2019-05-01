require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { User.create(email: "test@example.com", first_name: "John", last_name: "Doe", password: "asdf123", password_confirmation: "asdf123") }
  let!(:post) { Post.create(date: Date.today, rationale: "Anything", user_id: user.id) }

  describe 'Creation' do
    it 'can be created' do
      expect(post).to be_valid
    end

    it 'cannot be created without a date and rationale' do
      post.update_attributes(date: nil, rationale: nil)
      expect(post).to_not be_valid
    end
  end
end
