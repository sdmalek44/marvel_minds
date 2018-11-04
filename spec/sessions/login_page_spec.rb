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
      expect(page).to have_content('Successfully Created Account!')

      click_on 'Sign Out'

      expect(page).to have_content('Successfully Signed Out!')
      expect(current_path).to eq('/')
    end

    it 'cant create account if incorrect entry' do
      visit '/login'

      expect(page).to have_link('CREATE ACCOUNT')
      click_link('CREATE ACCOUNT')

      expect(current_path).to eq('/users/new')

      fill_in :username, with: ''
      fill_in :password, with: 'bob'
      click_on 'CREATE ACCOUNT'

      expect(current_path).to eq('/users')
      expect(page).to have_content('Username Invalid or Already Exists!')
    end

    it 'can enter info to log in if they have account' do
      user = create(:user, {password: 'candy'})

      visit '/login'

      fill_in :username, with: user.username
      fill_in :password, with: 'candy'
      click_on 'SIGN IN'

      expect(current_path).to eq('/')
      expect(page).to have_content('Successfully Signed In!')
    end
    it 'cant log in if incorrect entry' do
      user = create(:user, {password: 'candy'})

      visit '/login'

      fill_in :username, with: ''
      fill_in :password, with: 'candy'
      click_on 'SIGN IN'

      expect(current_path).to eq('/login')
      expect(page).to have_content('Unsuccessful Sign In Attempt!')
    end
  end
end
