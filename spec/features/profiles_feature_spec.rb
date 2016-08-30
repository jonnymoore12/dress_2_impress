require 'rails_helper'

feature 'User Profiles page' do
  let!(:user){ User.create(email: 'test@gmail.com',
                          password: 'password123',
                          password_confirmation: 'password123')}

  scenario 'Users can visit their own profile page' do
    sign_in
    click_link "Profile"
    expect(current_path).to eq "/users/#{user.id}"
    expect(page).to have_content "Welcome to test@gmail.com's wardrobe"
  end
end
