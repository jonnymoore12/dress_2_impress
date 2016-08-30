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

def add_dilemma
  visit '/'
  click_link 'Add a dilemma'
  fill_in 'Occasion', with: 'Restaurant first date'
  attach_file 'dilemma_option1', Rails.root + 'spec/fixtures/flowers.jpg'
  attach_file 'dilemma_option2', Rails.root + 'spec/fixtures/sumo.jpg'
  click_button 'Create Dilemma'
end
