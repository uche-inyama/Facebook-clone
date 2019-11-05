# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Likes' do
  scenario 'liking and unliking a post' do
    register_user('uac5@gmail.com')
    create_post
    click_on('Like', match: :first)
    expect(page).to have_content('Like(1)')
    click_on('Like', match: :first)
    expect(page).to have_content('Like(0)')
  end

  scenario 'liking a comment' do
    visit posts_path
    sign_in_user('uac5@gmail.com')
    comment_post
    within('#comment_div', match: :first) { click_on 'Like' }
    within('#comment_div', match: :first) { expect(page).to have_content('Like(1)') }
    within('#comment_div', match: :first) { click_on 'Like' }
    within('#comment_div', match: :first) { expect(page).to have_content('Like(0)') }
  end
end
