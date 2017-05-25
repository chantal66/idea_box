require 'rails_helper'

describe 'registered user can login' do
  it 'a registered user can login' do
    user = User.create(username: 'chantal', email: 'chantal@example.com', password: 'password')

    visit root_path

    click_on 'Login'

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'

    click_button 'Login'

    expect(current_path).to eq(user_path)
    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to have_link("Logout", href: logout_path)
  end
end