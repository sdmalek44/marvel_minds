require 'rails_helper'

describe 'visit /login' do
  context 'unregistered user' do
    it 'can click to create an account' do
      visit '/login'

      expect(page).to have_link('CREATE ACCOUNT')
      click_link('CREATE ACCOUNT')

      expect(current_path).to eq('/users/new')

      fill_in :username, with: 'bob'
      fill_in :password, with: 'bob'
      click_on 'CREATE ACCOUNT'

      expect(current_path).to eq('/')
      expect(page).to have_content('Sign Out')
      expect(page).to have_content('Successfully Signed in!')
    end
  end
end
