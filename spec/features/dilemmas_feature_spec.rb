require 'rails_helper'

feature 'Dilemma' do
  context 'no dilemmas added' do
    it 'confirms that there are no dilemmas' do
      visit '/dilemmas'
      expect(page).to have_content 'This page is naked'
      expect(page).to have_button 'Add a dilemma'
    end
  end

  context 'dilemma has been added' do
    before do
      sign_up
      add_dilemma
    end
    it 'displays dilemma' do
      visit '/dilemmas'
      expect(page).to have_content 'Restaurant first date'
      expect(page).not_to have_content 'This page is naked'
    end
  end

  context 'managing dilemmas' do

    before do
      sign_up
      add_dilemma
    end
    scenario 'user can add a dilemma' do
      expect(page).to have_content 'Restaurant first date'
      expect(page).to have_css "img[src*='Gok1.jpg']"
      expect(page).to have_css "img[src*='Gok2.jpg']"
      expect(current_path).to eq '/dilemmas'
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
end
