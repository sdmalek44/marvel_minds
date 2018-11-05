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
  end
end
