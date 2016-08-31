require 'rails_helper'

feature 'User Profiles page' do
  let!(:user){ User.create(name: 'mrdude',
                          email: 'test@gmail.com',
                          password: 'password123',
                          password_confirmation: 'password123')}

  context 'No historical dilemmas' do
    scenario 'Users can visit their own profile page' do
      sign_in
      click_link "Wardrobe"
      expect(current_path).to eq "/users/#{user.id}"
      expect(page).to have_content "Welcome to mrdude's wardrobe"
      expect(page).to have_content "mrdude's wardrobe is empty"
    end
  end

  context 'At least one historical dilemma' do
    scenario "User's dilemmas are displayed" do
      sign_in
      add_dilemma
      click_link "Wardrobe"
      expect(current_path).to eq "/users/#{user.id}"
      expect(page).to have_css "img[src*='Gok1.jpg']"
      expect(page).to have_css "img[src*='Gok2.jpg']"
      expect(page).to have_content "Restaurant first date"
    end
  end

end
