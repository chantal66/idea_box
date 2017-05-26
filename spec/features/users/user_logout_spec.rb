require 'rails_helper'

RSpec.feature 'User can logout' do
  scenario 'logged in user can logout' do
    user = User.create(username: 'chantal', email: 'chantal@example.com', password: 'password')

      visit login_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: 'password'
      click_button 'Login'

      visit ideas_path
      click_link 'Logout'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out Successfully')
      expect(page).not_to have_link('Logout', href: logout_path)
      expect(page).not_to have_content('Welcome, Chantal!')
      expect(page).to have_link('Login', href: login_path)
      expect(page).to have_link('Create Account', href: new_user_path)
  end
end