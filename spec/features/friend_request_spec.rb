# sign up
# Go to user's index
# click add friend
# expect_page to have Request sent


require 'rails_helper'

RSpec.feature 'friend_request' do
    scenario 'Send a friend Request' do
        register_user('uchenry.iny@gmail.com')
        click_on 'Sign out'
        register_user('xyz@gmail.com')
        visit users_path
        find_button('Add friend')[1].click
        # click_on('Add friend')
        expect(page).to have_content('Request sent')
    end
    scenario 'recieving a friend Request' do
        sign_in_user('uchenry.iny@gmail.com')
        visit  friend_requests_path
        click_on('Accept request')
        click_on 'Friends'
        expect(page).to have_button('Unfriend')
    end
end

