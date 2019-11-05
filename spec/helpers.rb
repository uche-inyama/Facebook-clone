# frozen_string_literal: true

module Helpers
  def register_user(email)
    visit new_user_registration_path
    fill_in 'First name', with: 'Uche'
    fill_in 'Surname', with: 'Inyama'
    fill_in 'Email', with: email
    fill_in 'Password', with: '1234asdf'
    fill_in 'Password confirmation', with: '1234asdf'
    page.find('#user_date_of_birth').set('2000-10-04')
    select('Male', from: 'user_gender')
    click_button 'Sign up'
  end

  def sign_in_user(email)
    visit '/login'
    fill_in 'Email', with: email
    fill_in 'Password', with: '1234asdf'
    click_button 'Log in'
  end

  def create_post
    fill_in 'Tell your tale', with: 'My new post'
    click_button 'Submit'
  end

  def comment_post
    comment = find('#comment_body', match: :first)
    comment.fill_in with: 'a new comment'
    click_button('Comment', match: :first)
  end
end
