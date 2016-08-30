require 'rails_helper'

feature 'Signing in and out' do
  context 'Users not signed in' do
    scenario 'sign in and sign up links should be visible' do
      visit '/dilemmas'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end
  end

  context 'Users signed in' do
    scenario 'sign out link should be visible' do
      sign_up
      expect(page).to have_content 'Sign out'
      expect(page).not_to have_content 'Sign up'
      expect(current_path).to eq '/'
    end
  end

  context 'signing up' do
    scenario 'cannot without an email' do
      visit '/dilemmas'
      sign_up(email: '')
      expect(page).to have_content("Email can't be blank")
    end
    scenario 'cannot without a name' do
      visit '/dilemmas'
      sign_up(name: '')
      expect(page).to have_content("Name can't be blank")
    end
  end


end
