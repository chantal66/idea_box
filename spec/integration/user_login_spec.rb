require 'rails_helper'

describe 'registered user can login' do
  it 'a registered user can login' do
    user = User.create(username: 'admin', password: 'password')

    visit login_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'

    click_button 'Login'

    assert page.has_content?('Welcome, admin')
  end
end