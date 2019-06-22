require 'rails_helper'

RSpec.describe 'Log out workflow', type: :feature do
  it 'destroys their session tracking for user' do
    @user = create(:user, email:'user@email.com', password: 'test')
    visit login_path

    fill_in :email, with: @user.email
    fill_in :password, with: 'test'
    click_button 'Log In'
    expect(current_path).to eq(dashboard_path)

    within '.navbar' do
      click_link 'Log Out'
    end

    expect(current_path).to eq(login_path)

    within '.navbar' do
      expect(page).to have_link('Log in')
      expect(page).to_not have_link('Log out')
    end
  end
end
