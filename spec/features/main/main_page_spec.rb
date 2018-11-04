require 'rails_helper'

describe '/' do
  context 'unregistered user' do
    it 'can see title and description' do
      visit '/'
      desc = "Learn about Marvel comic book characters and series in a fun way!"

      expect(page).to have_content("WELCOME TO")
      expect(page).to have_content("MARVEL MINDS")
      expect(page).to have_content(desc)
    end
    it 'can click to visit characters' do
      visit '/'

      expect(page).to have_link("CHARACTERS")
      click_link 'CHARACTERS'

      expect(current_path).to eq('/characters')
    end
    it 'can click to visit series' do
      visit '/'

      expect(page).to have_link("SERIES")
      click_link 'SERIES'

      expect(current_path).to eq('/series')
    end
  end
end
