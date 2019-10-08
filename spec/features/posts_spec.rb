require 'rails_helper'

RSpec.feature 'Post Management' do
  scenario 'create new post' do
    register_user
    sign_in_user
    fill_in 'Create a post', with: 'My new post'
    click_button 'Post'
    expect(page).to have_content('Post successfully created')
  end

  scenario 'edit post' do
    register_user
    sign_in_user
    fill_in 'Create a post', with: 'a new post'
    click_on 'Edit'
    fill_in 'Edit post', with: 'an updated post'
    click_on 'post'
    expect(page).to have_content('Post successfully edited')
  end

  # scenario 'delete post' do

  # end


end