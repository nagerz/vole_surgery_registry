# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'About show page' do
  describe 'content' do
    it 'has a title' do
      visit about_path

      expect(page).to have_content('Welcome to the Vole Surgery Registry')
    end

    it 'has a paragraph description' do
      visit about_path

      expect(page).to have_content("This is a site to organize and view voles.")
    end
  end

  describe 'As any kind of user' do
    it 'I can see about page' do
      @user = create(:user, email:'user@email.com', password: 'password')
      @admin = create(:admin, email:'user2@email.com', password: 'password')

      visit '/'

      click_on 'About'

      expect(current_path).to eq(about_path)

      login_as(@user)

      visit '/'

      click_on 'About'

      expect(current_path).to eq(about_path)

      click_on 'Log Out'

      login_as(@admin)

      visit '/'

      click_on 'About'

      expect(current_path).to eq(about_path)
    end
  end
end
