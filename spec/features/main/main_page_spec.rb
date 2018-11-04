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
  end
end
