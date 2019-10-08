require 'rails_helper'

RSpec.feature 'sign_up' do
    it 'signs me up' do
        visit '/users/sign_up'
        fill_in 'First name', with: 'Uche'
        fill_in  'Surname', with: 'Inyama'
        fill_in  'Email', with: 'uac@gmail.com'
        fill_in  'Password', with: '1234asdf'
        fill_in  'Password confirmation', with: '1234asdf'
        page.find('#user_date_of_birth').set('2000-10-04')
        select('Male', from: 'user_gender')
        click_button 'Sign up'
        expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
end