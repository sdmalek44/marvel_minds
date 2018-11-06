require 'rails_helper'

describe '/characters/:id' do
  context 'unregistered user' do
    it 'can see title and nav bar' do
      visit '/characters/1009351'

      desc = "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets."

      expect(page).to have_content("CHARACTER PROFILE")
      expect(page).to have_content("Hulk")
      expect(page).to have_content("Description: #{desc}")
      expect(page).to have_content("Series: 419")
      expect(page).to have_content("Events: 25")
    end
    it 'can see all events for character' do
      visit '/characters/1009351'
      desc = 'Loki sets about convincing the super-villains of Earth to attack heroes other than those they normally fight in an attempt to destroy the Avengers to absolve his guilt over inadvertently creating the team in the first place.'
      expect(page).to have_content('Acts of Vengeance!')
      expect(page).to have_content(desc)
    end
    it 'can see all series for character' do
      visit '/characters/1009351'
      desc = "Get ready for action-packed stories featuring team-ups from your favorite Marvel heroes every month! First, a story where Wolverine and Hulk come together, and then Captain America and Cable meet up! But will each partner's combined strength be enough?"
      expect(page).to have_content('A+X (2012 - Present)')
    end
  end
  context 'registered user' do
    it 'can add a favorite character' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/characters/1009351'

      click_on 'ADD TO FAVORITES'

      expect(current_path).to eq('/characters/1009351')
      expect(page).to have_content("Successfully Added to Favorites!")

      expect(Favorite.all.length).to eq(1)
    end
  end
end
