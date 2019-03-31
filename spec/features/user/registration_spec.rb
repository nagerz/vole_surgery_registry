require 'rails_helper'

RSpec.describe 'when authenticating visitors' do
  context 'a user trying to register' do
    it 'can register by providing all required info' do
      visit login_path
      click_on "Register"

      expect(current_path).to eq(register_path)

      fill_in :user_name, with: "user_1"
      fill_in :user_location, with: "1111 Street Dr."
      fill_in :user_state, with: "CO"
      fill_in :user_email, with: "user@email.com"
      fill_in :user_password, with: "test"
      fill_in :user_password_confirmation, with: "test"

      click_on "Create User"
      user = User.last

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Thank you for registering! You are now logged in.")
    end

    it "can't register with incomplete credentials" do
      expect(User.count).to eq(0)

      visit register_path

      fill_in :user_name, with: "user_2"
      #fill_in :user_email, with: "user_1@email.com"
      #fill_in :user_location, with: "1111 Street Dr."
      #fill_in :user_state, with: "CO"
      #fill_in :user_password, with: "test"
      #fill_in :user_password_confirmation, with: "test"

      click_on "Create User"

      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Location can't be blank")
      expect(page).to have_content("State can't be blank")
      expect(User.count).to eq(0)
    end

    it "can't register with an existing email address" do
      existing_user = create(:user, name: "existing",
                           email: "user_1@email.com",
                           location: "222 Street Dr.",
                           state: "CO",
                           password: "test",
                           password_confirmation: "test")
      expect(User.count).to eq(1)

      visit register_path

      fill_in :user_name, with: "user_2"
      fill_in :user_email, with: "user_1@email.com"
      fill_in :user_location, with: "1111 Street Dr."
      fill_in :user_state, with: "CO"
      fill_in :user_password, with: "test"
      fill_in :user_password_confirmation, with: "test"

      click_on "Create User"

      expect(page).to have_content("Email already taken. Please try again or log in with an existing account.")
      expect(User.last).to eq(existing_user)
    end

    it 'after registering with duplicate email, it will render form with all fields filled in except email and passwords' do
      create(:user, name: 'user_1', email: 'user_1@email.com', password: 'test')

      visit register_path

      fill_in :user_name, with: "user_2"
      fill_in :user_email, with: "user_1@email.com"
      fill_in :user_location, with: "1111 Street Dr."
      fill_in :user_state, with: "CO"
      fill_in :user_password, with: "test"
      fill_in :user_password_confirmation, with: "test"

      click_on "Create User"

      expect(page).to have_field(:user_name, with: 'user_2')
      expect(page).to_not have_field(:user_email, with: "user_1@email.com")
      expect(page).to have_field(:user_location, with: '1111 Street Dr.')
      expect(page).to have_field(:user_state, with: 'CO')
      expect(page).to_not have_field(:user_password, with: 'test')
      expect(page).to_not have_field(:user_password_confirmation, with: 'test')
    end

  end
end
