require 'rails_helper'

def sign_up(name: "Gokwan",
           email: "test@gmail.com",
        password: "password123",
        password_confirmation: "password123" )

  visit '/dilemmas'
  click_link 'Sign up'
  fill_in 'Name', with: name
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
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button 'Log in'
end

def add_dilemma(occasion = 'Restaurant first date')
  visit '/'
  click_button 'Add a dilemma'
  fill_in 'Occasion', with: occasion
  attach_file 'dilemma_option1', Rails.root + 'spec/fixtures/Gok1.jpg'
  attach_file 'dilemma_option2', Rails.root + 'spec/fixtures/Gok2.jpg'
  click_button 'Create Dilemma'
end

def add_dilemma_with_only_one_file
  visit '/'
  click_button 'Add a dilemma'
  fill_in 'Occasion', with: 'Restaurant first date'
  attach_file 'dilemma_option1', Rails.root + 'spec/fixtures/Gok1.jpg'
  click_button 'Create Dilemma'
end
