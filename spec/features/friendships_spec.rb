# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friendship' do
  scenario 'remove a friend from friendship' do
    register_user('uchenry.iny2@gmail.com')
    click_on 'Sign out'
    register_user('xyz2@gmail.com')
    visit users_path
    click_on('Add friend', match: :first)
    click_on 'Sign out'
    sign_in_user('uchenry.iny2@gmail.com')
    visit friend_requests_path
    click_on('Accept request')
    click_on 'Friends'
    click_on 'Unfriend'
    expect(page).to have_content('Friend removed')
  end
end
