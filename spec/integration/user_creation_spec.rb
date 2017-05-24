require 'rails_helper'


describe 'Users can be created' do
  describe 'a user can be created' do
    it 'a user can be created' do
      visit new_user_path
      fill_in 'Username', with: 'chantal'
      fill_in 'Password', with: 'password'

      click_button 'Create Account'

      assert page.has_content?('Welcome, chantal')
    end
  end
end