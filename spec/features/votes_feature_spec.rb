require 'rails_helper'

feature 'reviewing' do
  before { Dilemma.create occasion: 'wedding' }

  scenario 'allows users to vote on a dilemma using a form' do
    visit '/dilemmas'
    click_button 'Vote'
    expect(current_path).to eq '/dilemmas'
    expect(page).to have_content('You have voted')
  end


end
