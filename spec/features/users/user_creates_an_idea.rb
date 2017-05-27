require 'rails_helper'
require 'login_helper'

describe 'User create a new idea' do
  scenario 'a user can create a new idea' do

    user_login
    click_on 'New Idea'

    expect(current_path).to eq(new_user_idea_path)

    fill_in 'idea[title]', with: 'Weather App'
    fill_in 'idea[description]', with: 'Some awesome description goes here'
    click_button 'Create Idea'

    # expect(current_path).to eq(user_idea_path)
    expect(page).to have_content('Weather App')
    expect(page).to have_content('Some awesome description goes here')

  end
end