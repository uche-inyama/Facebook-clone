require 'rails_helper'

RSpec.feature 'Sign in' do
    # let(:user) {build(:user)}
    user = User.create(first_name: 'Uche', surname: 'Inyama', email: 'MyString@yaya.com', password: 'password', date_of_birth:'2017-05-05', gender: 'Male')
    it 'should sign_in a registered user' do
        visit '/users/sign_in'
        fill_in 'Email', with: 'MyString@yaya.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        expect(page).to have_content 'Signed in successfully.'
    end
end