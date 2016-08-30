require 'rails_helper'

feature 'Dilemma' do
  context 'no dilemmas added' do
    it 'confirms that there are no dilemmas' do
      visit '/dilemmas'
      expect(page).to have_content 'This page is naked'
      expect(page).to have_link 'Add a dilemma'
    end
  end
  context 'dilemma has been added' do
    before do
      Dilemma.create!(occasion: 'Restaurant first date')
    end
    it 'displays dilemma' do
      visit '/dilemmas'
      expect(page).to have_content 'Restaurant first date'
      expect(page).not_to have_content 'This page is naked'
    end

  end
end
