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
  end
end
