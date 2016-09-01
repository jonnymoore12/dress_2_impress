require 'rails_helper'

feature 'Votes' do
  let!(:dilemma) { Dilemma.create occasion: 'wedding' }

  scenario 'Allows users to vote on a dilemma' do
    visit '/dilemmas'
    sign_up
    click_button '1'
    expect(current_path).to eq "/dilemmas/#{dilemma.id}"
    expect(page).to have_content('You have voted')
  end

  context 'User not signed in' do
    scenario 'user cannot see dilemmas' do
      visit '/'
      expect(page).to have_content 'This page is naked'
      expect(page).not_to have_content 'wedding'
    end
  end

  xcontext 'User has voted on a dilemma' do
    scenario 'updates total votes' do
      sign_up
      click_button '1'
      expect(current_path).to eq "/dilemmas/#{dilemma.id}"
      #click_link 'Sign out' - NEED TO DISCUSS - SIGNED OUT USERS CANT SEE DILEMMAS
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

  xcontext 'No user has voted' do
    scenario 'will confirm 0 votes' do
      visit "/dilemmas/#{dilemma.id}"
      sign_up
      expect(page).to have_content('Option 1: 0')
      expect(page).to have_content('Option 2: 0')
    end
  end

  # Either in here or in dilemmas, perhaps a test to show that we receive the
  # "no more dilemmas. The world is fashionable" message.

end
