def user_login
  user = User.create(username: 'chantal', email: 'chantal@example.com', password: 'password')

  visit root_path

  click_on 'Login'
  fill_in 'Username', with: user.username
  fill_in 'Password', with: 'password'
  click_button 'Login'
end