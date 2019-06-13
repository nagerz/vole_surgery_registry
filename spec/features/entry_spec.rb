require 'rails_helper'

RSpec.describe 'root page redirect', type: :feature do
  describe 'As any user visiting the root directory' do
    context 'I am redirected based on if I am signed in or not' do
      it 'as a visitor' do
        visit root_path

        expect(current_path).to eq(login_path)
      end
      it 'as a regular user' do
        @user = create(:user)

        login_as(@user)

        visit root_path

        expect(current_path).to eq(dashboard_path)
      end
      it 'as an admin user' do
        @user = create(:admin)

        login_as(@user)

        visit root_path

        expect(current_path).to eq(admin_dashboard_path(@user))
      end
    end
  end
end
