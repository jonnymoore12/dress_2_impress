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

end
