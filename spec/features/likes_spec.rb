# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Likes' do
  scenario 'liking a post' do
    register_user('uac5@gmail.com')
    create_post
    click_on('Like', match: :first)
    expect(page).to have_content('1 Like')
    click_on('Like', match: :first)
    expect(page).to have_content('0 Likes')
  end

  scenario 'liking a comment' do
    visit posts_path
    sign_in_user('uac5@gmail.com')
    comment_post
    within('#comment_div', match: :first) { click_on 'Like' }
    within('#comment_div', match: :first) { expect(page).to have_content('1 Like') }
    within('#comment_div', match: :first) { click_on 'Like' }
    within('#comment_div', match: :first) { expect(page).to have_content('0 Likes') }
  end
end
