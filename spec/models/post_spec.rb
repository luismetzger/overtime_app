require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post) }

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
