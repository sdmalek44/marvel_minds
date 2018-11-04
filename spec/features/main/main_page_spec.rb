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
    it 'can click on favorites if not logged in' do
      visit '/'

      expect(page).to have_link("FAVORITES")
      click_link 'FAVORITES'

      expect(current_path).to eq('/login')
    end
    it 'can click on favorites if logged in' do
      user = create(:user)
      expect_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/'
      click_link 'FAVORITES'

      expect(current_path).to eq('/favorites')
    end
  end
end
