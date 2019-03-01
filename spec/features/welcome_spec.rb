require 'rails_helper'

describe 'As a user' do
  it 'displays a welcome page' do

	visit root_path

	expect(page).to have_content("Rock and Vole Hall of Fame")
  end
end
