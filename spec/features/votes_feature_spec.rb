require 'rails_helper'

feature 'Votes' do
  before { Dilemma.create occasion: 'wedding' }

  context 'User not signed in' do
    scenario 'user cannot vote' do
      visit '/dilemmas'
      click_button '1'
      expect(current_path).to eq '/users/sign_in'
    end
  end


  context 'User has voted on a dilemma' do
    scenario 'updates total votes' do
      sign_up
      click_button '1'
      expect(current_path).to eq '/dilemmas'
      click_link 'Sign out'
      expect(page).to have_content('Option 1: 1')
      expect(page).to have_content('Option 2: 0')
      # expect(page).to have_content('You have voted')
    end
    xscenario 'and cannot vote on the same dilemma again' do
      visit '/dilemmas'
      sign_up
      click_button '1'
      click_button '2'
      expect(current_path).to eq '/dilemmas'
      click_button 'Sign out'
      expect(page).to have_content('Option 1: 1')
      expect(page).to have_content('Option 2: 0')
      expect(page).to have_content('You have already voted on this dilemma')
    end
  end

  context 'No user has voted' do
    scenario 'will confirm 0 votes' do
      visit '/dilemmas'
      sign_up
      expect(page).to have_content('Option 1: 0')
      expect(page).to have_content('Option 2: 0')
    end
  end


end
