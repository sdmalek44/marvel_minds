require 'rails_helper'

describe '/series' do
  context 'unregistered user' do
    it 'can see title and nav bar' do
      VCR.use_cassette('series') do
        visit '/series'

        expect(page).to have_content('MARVEL SERIES')
        expect(page).to have_link('HOME')
        expect(page).to have_link('CHARACTERS')
        expect(page).to have_link('SERIES')
        expect(page).to have_link('FAVORITES')
        expect(page).to have_link('SIGN IN')
      end
    end
    it 'can search by input field' do
      VCR.use_cassette('series_1') do
        visit '/series'

        fill_in 'cal-input', with: 'X-23'

        click_on 'SEARCH'

        desc = "Wolverine's young clone strikes out on her own! Raised as a living weapon, Laura struggles to find something resembling a normal life even as she finds herself targeted by those who would use her and do her harm...but anybody after X-23 better beware!"
        expect(page).to have_content('Title: X-23 (2010 - 2012)')
        expect(page).to have_content("Characters: 11")
        expect(page).to have_content("Events: 0")
      end
    end
    it 'can click on a character and go to show page' do
      VCR.use_cassette('series_2') do
        visit '/series'

        fill_in 'cal-input', with: 'X-Men'

        click_on 'SEARCH'

        first('.hero-card').click

        expect(current_path).to eq('/series/2100')
      end
    end
  end
end
