require 'rails_helper'

feature 'Votes' do


  scenario 'Allows users to vote on a dilemma' do
    sign_up
    add_dilemma
    visit '/dilemmas'
    click_button '1'
    expect(page).to have_content('You have voted')
    expect(page).to have_content('1')
    expect(page).to have_content('0')
  end


  # Either in here or in dilemmas, perhaps a test to show that we receive the
  # "no more dilemmas. The world is fashionable" message.

end
