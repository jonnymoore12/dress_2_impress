require 'rails_helper'

feature 'Dilemma' do
  context 'No dilemmas added' do
    it 'confirms that there are no dilemmas' do
      visit '/dilemmas'
      expect(page).to have_content 'This page is naked'
    end
  end

  context 'Dilemma has been added' do
    before do
      sign_up
      add_dilemma
    end

    it 'displays dilemma' do
      expect(page).to have_content 'Restaurant first date'
      expect(page).not_to have_content 'This page is naked'
    end
  end

  context 'managing dilemmas' do

    before do
      sign_up
      add_dilemma
    end
    scenario 'User can add a dilemma' do
      expect(page).to have_content 'Restaurant first date'
      expect(page.find('#option1')['alt']).to have_content 'Gok1'
      expect(page.find('#option2')['alt']).to have_content 'Gok2'
    end

    scenario 'user can delete their own dilemma' do
      click_link 'Wardrobe'
      @current_path = current_path
      click_link 'Delete'
      expect(page).to have_content 'Dilemma deleted'
      expect(page).not_to have_content 'Restaurant first date'
      expect(page).not_to have_css "img[src*='Gok1.jpg']"
      expect(page).not_to have_css "img[src*='Gok2.jpg']"
      expect(current_path).to eq @current_path

    end
  end

  context 'creating dilemma' do
    scenario 'does not create dilemma if user does not add two photos' do
      sign_up
      add_dilemma_with_only_one_file
      expect(page).not_to have_content 'Restaurant first date'
      expect(page).not_to have_css "img[src*='Gok1.jpg']"
    end
  end

  context 'No user signed in' do
    scenario 'User cannot add a dilemma' do
      visit '/'
      expect(current_path).to eq '/'
      expect(page).not_to have_content 'Add a dilemma'
    end
  end

  context 'Displaying dilemmas' do
    before do
      sign_up
      add_dilemma
    end

    scenario 'Signed in user does not see dilemmas they have already voted on' do
      click_link 'Sign out'
      sign_up(name: "test2", email: "else@test.com", password: "123456", password_confirmation: "123456")
      first('.dilemmadiv').click_button('1')
      click_link 'Next dilemma'
      expect(page).not_to have_content 'Restaurant first date'
    end

    scenario 'Dilemmas are displayed one at a time' do
      add_dilemma(occasion: "Cinema date")
      visit '/dilemmas'
      expect(page).to have_content "Restaurant first date"
      expect(page).not_to have_content "Cinema date"
    end
  end

end
