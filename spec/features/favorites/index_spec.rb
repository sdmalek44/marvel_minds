require 'rails_helper'

describe '/favorites' do
  context 'registered user' do
    it 'can add a favorite character' do
      user = create(:user)
      favorite = create(:favorite_character)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/favorites'

      expect(page).to have_content(favorite.name)
      expect(page).to have_content(favorite.description)
    end
    it 'can add a favorite series' do
      user = create(:user)
      favorite = create(:favorite_series)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/favorites'

      expect(page).to have_content(favorite.title)
      expect(page).to have_content(favorite.start_year)
      expect(page).to have_content(favorite.end_year)
    end
  end
end
