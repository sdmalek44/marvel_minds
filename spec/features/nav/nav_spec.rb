require 'rails_helper'

describe 'any index page' do
  context 'unregistered user' do
    it 'can see title and nav bar' do
      visit '/characters'

      expect(page).to have_link('HOME')
      expect(page).to have_link('CHARACTERS')
      expect(page).to have_link('SERIES')
      expect(page).to have_link('FAVORITES')
      expect(page).to have_link('SIGN IN')
    end
    it 'can visit home' do
      visit '/characters'

      click_link 'HOME'

      expect(current_path).to eq('/')
    end
    it 'can visit characters index' do
      visit '/characters'

      click_link 'CHARACTERS'

      expect(current_path).to eq('/characters')
    end
    it 'can visit series index' do
      visit '/characters'

      click_link 'SERIES'

      expect(current_path).to eq('/series')
    end
    it 'can visit login for favorites' do
      visit '/characters'

      click_link 'FAVORITES'

      expect(current_path).to eq('/login')
    end
    it 'can visit login' do
      visit '/characters'

      click_link 'SIGN IN'

      expect(current_path).to eq('/login')
    end
  end
  context 'registered user' do
    it 'can see title and nav bar' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/characters'

      expect(page).to have_link('HOME')
      expect(page).to have_link('CHARACTERS')
      expect(page).to have_link('SERIES')
      expect(page).to have_link('FAVORITES')
      expect(page).to have_link('SIGN OUT')
    end
    it 'can visit favorites if logged in' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/characters'

      click_link 'FAVORITES'

      expect(current_path).to eq('/favorites')
    end
    it 'can sign out if logged in' do
      user = create(:user, {password: 'candy'})

      visit '/login'

      fill_in :username, with: user.username
      fill_in :password, with: 'candy'
      click_on 'SIGN IN'

      click_on 'CHARACTERS'

      click_link 'SIGN OUT'

      expect(current_path).to eq('/')
      expect(page).to have_content('Successfully Signed Out!')
    end
  end
end
