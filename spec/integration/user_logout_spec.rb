require 'rails_helper'

describe 'logged in user can logout' do

  it 'can log out' do
    user = User.create(username: 'admin', password: 'password')

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'

    assert page.has_content?('Welcome, admin')

    click_link 'Logout'

    refute page.has_content?('Welcome, admin')

  end
end