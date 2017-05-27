require 'rails_helper'

describe 'User can see all ideas' do
  scenario 'a user can see all ideas' do
    user = create(:user)
    @idea = user.ideas.create(title: 'Weather App', description: 'Awesome, never seen app')
    @idea = user.ideas.create(title: 'invisible mug', description: 'terrible idea')

    visit user_ideas_path(user)

    expect(page).to have_content('Weather App')
    expect(page).to have_content('invisible mug')
  end
end
