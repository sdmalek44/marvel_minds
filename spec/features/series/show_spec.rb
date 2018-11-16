require 'rails_helper'

describe '/series/:id' do
  context 'registered user' do
    it 'can add a favorite character' do
      VCR.use_cassette('series_show') do
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/series/18454'

        click_on 'ADD TO FAVORITES'

        expect(current_path).to eq('/series/18454')
        expect(page).to have_content("This card is now in your Favorites!")

        expect(FavoriteSeries.all.length).to eq(1)
      end
    end
  end
end
