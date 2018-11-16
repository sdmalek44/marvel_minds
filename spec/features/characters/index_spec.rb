require 'rails_helper'

describe '/characters' do
  context 'unregistered user' do
    it 'can see title and nav bar' do
      visit '/characters'

      expect(page).to have_content('MARVEL CHARACTERS')
      expect(page).to have_link('HOME')
      expect(page).to have_link('CHARACTERS')
      expect(page).to have_link('SERIES')
      expect(page).to have_link('FAVORITES')
      expect(page).to have_link('SIGN IN')
    end
    it 'can search by input field' do
      visit '/characters'

      fill_in 'cal-input', with: 'Hulk'

      click_on 'SEARCH'

      desc = "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets."

      expect(page).to have_content('Name: Hulk')
      expect(page).to have_content("Description: #{desc}")
      expect(page).to have_content("Series: 420")
      expect(page).to have_content("Events: 25")
    end
    it 'can click on a character and go to show page' do
      visit '/characters'

      fill_in 'cal-input', with: 'Hulk'

      click_on 'SEARCH'

      first('.hero-card').click

      expect(current_path).to eq('/characters/1009351')
    end
  end
end
