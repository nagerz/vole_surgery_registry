require 'rails_helper'

RSpec.describe 'root page redirect', type: :feature do
  describe 'As any user visiting the root directory' do
    context 'I am redirected based on if I am signed in or not' do
      scenario 'as a visitor' do
        visit root_path

        expect(current_path).to eq(login_path)
      end
      scenario 'as a regular user' do
        @user = create(:user, email:'user@email.com', password: 'password')

        visit root_path

        login_as(@user)

        expect(current_path).to eq(dashboard_path)
      end
      scenario 'as an admin user' do
        @user = create(:admin, email:'user@email.com', password: 'password')

        visit root_path

        login_as(@user)

        expect(current_path).to eq(admin_dashboard_path(@user))
      end
    end
  end
end
