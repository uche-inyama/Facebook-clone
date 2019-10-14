# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comment' do
  scenario 'Adding a comment' do
    register_user('uac4@gmail.com')
    create_post
    visit posts_path
    fill_in 'comment_body', with: 'a new comment'
    click_on 'Comment'
    expect(page).to have_content('a new comment')
  end
end
