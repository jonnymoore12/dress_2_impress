require 'rails_helper'

feature 'Votes' do
  let!(:dilemma) { Dilemma.create! occasion: 'wedding'}

  scenario 'Allows users to vote on a dilemma' do
    sign_up
    visit '/dilemmas'
    click_button '1'
    expect(page).to have_content('You have voted')
    expect(page).to have_content('1')
    expect(page).to have_content('0')
  end

  context 'User not signed in' do
    scenario 'user cannot see dilemmas' do
      visit '/'
      expect(page).to have_content 'This page is naked'
      expect(page).not_to have_content 'wedding'
    end
  end

  context 'No user has voted' do
    scenario 'will confirm 0 votes' do
      sign_up
      visit "/dilemmas/#{dilemma.id}"
      expect(page).to have_content('0')
      expect(page).to have_content('0')
    end
  end

  # Either in here or in dilemmas, perhaps a test to show that we receive the
  # "no more dilemmas. The world is fashionable" message.

end
