require 'rails_helper'

RSpec.describe 'login workflow', type: :feature do
  describe 'visitors try to login' do
    context 'succeeds when credentials are correct' do
      scenario 'as a regular user' do
        @user = create(:user, email:'user@email.com', password: 'password')
      end
      scenario 'as an admin user' do
        @user = create(:admin, email:'user@email.com', password: 'password')
      end
      after :each do
        visit login_path

        fill_in :email, with: @user.email
        fill_in :password, with: 'password'
        click_button 'Log In'
        if @user.researcher?
          expect(current_path).to eq(dashboard_path)
        elsif @user.admin?
          expect(current_path).to eq(admin_dashboard_path(@user))
        end
      end
    end

    describe 'fails when credentials are incorrect' do
      before :each do
        @user = create(:user, email:'user@gmail.com', password: 'password')
      end
      scenario 'with empty form' do
        visit login_path
        click_button 'Log In'

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Login failed. Please check your email address and password.")
      end
      scenario 'with bad email' do
        visit login_path

        fill_in :email, with: 'bad@email.com'
        fill_in :password, with: 'password'
        click_button 'Log In'

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Login failed. Please check your email address and password.")
      end
      scenario 'with bad password' do
        visit login_path

        fill_in :email, with: @user.email
        fill_in :password, with: 'badpassword'
        click_button 'Log In'

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Login failed. Please check your email address and password.")
      end
    end

    it 'fails if user is inactive' do
      user = create(:inactive_user, email: 'user@gmail.com', password: 'password')
        visit login_path

        fill_in :email, with: user.email
        fill_in :password, with: 'password'
        click_button 'Log In'

        expect(current_path).to eq(login_path)
        expect(page).to have_content('This account has been disabled. Please contact an administrator for help.')
    end

    describe 'redirects the user if they are already logged in' do
      scenario 'regular user' do
        @user = create(:user)
        login_as(@user)
      end
      scenario 'admin user' do
        @user = create(:admin)
        login_as(@user)
      end
      after :each do
        visit login_path

        if @user.researcher?
          expect(current_path).to eq(dashboard_path)
        elsif @user.admin?
          expect(current_path).to eq(admin_dashboard_path(@user))
        end
      end
    end

  end
end
