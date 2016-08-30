require 'rails_helper'

def sign_up(email: "test@gmail.com",
            password: "password123",
            password_confirmation: "password123" )

  visit '/dilemmas'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end


def sign_in(email: "test@gmail.com",
            password: "password123",
            password_confirmation: "password123")
  visit '/'
  click_link "Sign in"
  fill_in "Email", with: 'test@gmail.com'
  fill_in "Password", with: 'password123'
  click_button 'Log in'
end
