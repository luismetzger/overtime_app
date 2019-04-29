require 'rails_helper'

describe 'navigate' do
  context 'index' do
    let!(:post_path) { visit posts_path }

    it 'can be reached sucessfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end
  end

  context 'creation' do
    let!(:new_pos_path) { visit new_post_path }

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale")
    end
  end
end