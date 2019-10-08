# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign in' do
  it 'should sign_in a registered user' do
    register_user
    visit '/login'
    fill_in 'Email', with: 'uac@gmail.com'
    fill_in 'Password', with: '1234asdf'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it "shouldn't sign in with wrong password" do
    visit '/login'
    fill_in 'Email', with: 'uac@gmail.com'
    fill_in 'Password', with: '1234456'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
