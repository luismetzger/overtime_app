require 'rails_helper'

describe 'navigate' do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    let!(:post_path) { visit posts_path }
    let!(:post1) { FactoryBot.build_stubbed(:post) }
    let!(:post2) { FactoryBot.build_stubbed(:second_post) }

    it 'can be reached sucessfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      visit posts_path

      expect(page).to have_content(/rationale|content/)
    end
  end

  describe 'creation' do
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

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path
      click_link("new_post_from_nav")

      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    let!(:post) { FactoryBot.create(:post) }

    it 'can be reached by clicking edit on the index page' do
      visit posts_path
      click_link("edit_#{post.id}")

      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"

      click_on "Save"

      expect(page).to have_content("Edited content")
    end
  end

end