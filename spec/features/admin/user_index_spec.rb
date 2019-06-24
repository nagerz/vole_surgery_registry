require 'rails_helper'

RSpec.describe 'User index page' do
  feature 'As an admin visiting the admin dashboard' do
    before :each do
      @user1 = User.create!(name: "User 1",
                           email: "user_1@email.com",
                           location: "222 Street Dr.",
                           state: "CO",
                           password: "test",
                           password_confirmation: "test")
      @user2 = User.create!(name: "User 2",
                           email: "user_2@email.com",
                           location: "222 Street Dr.",
                           state: "CO",
                           password: "test",
                           password_confirmation: "test")
      @user3 = User.create!(name: "User 3",
                           email: "user_3@email.com",
                           location: "222 Street Dr.",
                           state: "CO",
                           password: "test",
                           password_confirmation: "test")
      @admin = User.create!(name: "Admin",
                           email: "admin@email.com",
                           location: "222 Street Dr.",
                           state: "CO",
                           password: "test",
                           password_confirmation: "test",
                           role: 1)
      @users = [@user1, @user2, @user3, @admin]
    end
    scenario 'can see all voles' do
      login_as(@admin)

      visit '/admin/dashboard'

      expect(page).to have_content("Voles:")

      # expect(page).to have_css('.vole-info', count: 3)
    end

    scenario 'can click link to see all users' do
      login_as(@admin)

      visit '/admin/dashboard'

      click_on 'Researchers'

      expect(current_path).to eq(admin_users_path)

      expect(page).to have_content("All Researchers:")

      @users.each do |user|
        within "#user-#{user.id}" do
          expect(page).to have_link(user.name)
          expect(page).to have_content("Voles checked out: ")
        end
      end
    end
  end

  feature 'As a regular user visiting the user index' do
    scenario 'sees a 404 error' do
      user = create(:user)

      allow_any_instance_of(Admin::BaseController).to receive(:current_user).and_return(user)

      visit admin_users_path

      expect(page).to have_content("The page you're looking for could not be found.")
    end
  end
end
