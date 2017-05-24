require 'rails_helper'

describe 'User create a new idea' do
  scenario 'a user ca create a new idea' do
    visit new_idea_path

    fill_in 'idea[title]', with: 'Weather App'

    click_button 'Create Idea'

    expect(current_path).to

  end


end