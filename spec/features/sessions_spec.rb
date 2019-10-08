require 'rails_helper'

RSpec.feature 'Sign in' do

  it 'should sign_in a registered user' do
      register_user
      visit '/users/sign_in'
      fill_in 'Email', with: 'uac@gmail.com'
      fill_in 'Password', with: '1234asdf'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
  end


  def register_user
      visit '/users/sign_up'
      fill_in 'First name', with: 'Uche'
      fill_in  'Surname', with: 'Inyama'
      fill_in  'Email', with: 'uac@gmail.com'
      fill_in  'Password', with: '1234asdf'
      fill_in  'Password confirmation', with: '1234asdf'
      page.find('#user_date_of_birth').set('2000-10-04')
      select('Male', from: 'user_gender')
      click_button 'Sign up'
      click_on 'Sign out'
  end
end