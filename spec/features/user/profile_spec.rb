require 'rails_helper'

RSpec.describe 'user profile', type: :feature do
  before :each do
    @user = User.create!(name: "existing",
                         email: "user_1@email.com",
                         location: "222 Street Dr.",
                         state: "CO",
                         password: "test",
                         password_confirmation: "test")
  end

  describe 'registered user visits their profile' do
    it 'shows user information' do
      login_as(@user)

      visit dashboard_path

      expect(page).to have_content("Name: #{@user.name}")
      expect(page).to have_content("Role: #{@user.role}")
      expect(page).to have_content("Email: #{@user.email}")
      expect(page).to have_content("Location: #{@user.location}")
      expect(page).to have_content("State: #{@user.state}")
      expect(page).to have_link('Log Out')
      #expect(page).to have_link('Edit')
    end
  end

end
