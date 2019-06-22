require 'rails_helper'

RSpec.describe 'Visitor home page', type: :feature do
  describe 'As a visitor visiting the root directory' do
    it 'I am redirected to the login page' do
      visit root_path

      expect(current_path).to eq(login_path)
    end

    it 'I see a navigation bar' do
      visit root_path

      within '.navbar' do
        expect(page).to have_link('Log In')
        expect(page).to have_link('Register')
        expect(page).to have_link('About')
      end
    end

    it 'I see log in and register links' do
      visit root_path

      within '.login' do
        expect(page).to have_button('Log In')
        expect(page).to have_link('Register')
      end
    end

    describe 'within the navbar' do
      describe 'I can click on' do
        it 'the Log In link' do
          visit root_path

          within '.navbar' do
            click_link 'Log In'

            expect(current_path).to eq(login_path)
          end
        end

        it 'the Register link' do
          visit root_path

          within '.navbar' do
            click_link 'Register'

            expect(current_path).to eq(register_path)
          end
        end

        it 'the About link' do
          visit root_path

          within '.navbar' do
            click_link 'About'

            expect(current_path).to eq(about_path)
          end
        end
      end
    end
  end
end
