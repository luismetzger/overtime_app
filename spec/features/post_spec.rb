require 'rails_helper'

describe 'navigate' do
  let!(:user) { User.create!(email: "test@example.com", first_name: "John", last_name: "Doe", password: "asdf123", password_confirmation: "asdf123") }

  before do
    login_as(user, :scope => :user)
  end

  context 'index' do
    let!(:post_path) { visit posts_path }
    let!(:post1) { Post.create!(date: Date.yesterday, rationale: "Post1", user_id: user.id) }
    let!(:post2) { Post.create!(date: Date.today, rationale: "Post2", user_id: user.id) }

    it 'can be reached sucessfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      visit posts_path

      expect(page).to have_content(/Post1|Post2/)
    end
  end

  context 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User association")
    end
  end
end