require 'rails_helper'

feature 'Reviewing' do
  let!(:dilemma) { Dilemma.create occasion: 'wedding' }

  scenario 'Allows users to vote on a dilemma' do
    visit '/dilemmas'
    sign_up
    click_button '1'
    expect(current_path).to eq "/dilemmas/#{dilemma.id}"
    expect(page).to have_content('You have voted')
  end

  # Either in here or in dilemmas, perhaps a test to show that we receive the
  # "no more dilemmas. The world is fashionable" message.

end
