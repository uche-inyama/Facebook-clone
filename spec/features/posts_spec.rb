require 'rails_helper'

RSpec.feature 'Post Management' do
  scenario 'create new post' do
    register_user
    sign_in_user
    fill_in 'Create a post', with: 'My new post'
    click_button 'Post'
    expect(page).to have_content('Post successfully created')
  end

  # scenario 'edit post' do

  # end

  # scenario 'delete post' do

  # end


end