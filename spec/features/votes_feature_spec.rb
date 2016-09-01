require 'rails_helper'

feature 'Votes' do
  before { Dilemma.create occasion: 'wedding' }

  context 'User has voted on a dilemma' do
    scenario 'updates total votes' do
      visit '/dilemmas'
      click_button '1'
      expect(current_path).to eq '/dilemmas'
      expect(page).to have_content('Option 1: 1')
      expect(page).to have_content('Option 2: 0')
      expect(page).to have_content('You have voted')
    end
    scenario 'and cannot vote on the same dilemma again' do
      visit '/dilemmas'
      click_button '1'
      click_button '2'
      expect(current_path).to eq '/dilemmas'
      expect(page).to have_content('Option 1: 1')
      expect(page).to have_content('Option 2: 0')
      expect(page).to have_content('You have already voted on this dilemma')
    end
    # scenario 'user cannot vote if they\'re not signed up and logged in' do
    #
    # end
  end

  context 'No user has voted' do
    scenario 'will confirm 0 votes' do
      visit '/dilemmas'
      expect(page).to have_content('Option 1: 0')
      expect(page).to have_content('Option 2: 0')
    end
  end


end
