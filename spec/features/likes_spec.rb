
require 'rails_helper'

RSpec.feature 'Likes' do
    scenario 'liking a post' do
        register_user('uac5@gmail.com')
        create_post
        click_on 'Like'
        expect(page).to have_content('1 Likes')
        click_on 'Like'
        expect(page).to have_content('0 Likes')
    end

    scenario 'liking a comment' do
        register_user('uac5@gmail.com')
        create_post
        comment_post
        click_on 'Like'
        expect(page).to have_content('1 Likes')
        click_on 'Like'
        expect(page).to have_content('0 Likes')
    end
end


# scenario "Signing in as another user" do
#     visit '/sessions/new'
#     within("#session") do
#       fill_in 'Email', with: other_user.email
#       fill_in 'Password', with: other_user.password
#     end
#     click_button 'Sign in'
#     expect(page).to have_content 'Invalid email or password'
#   end
# end