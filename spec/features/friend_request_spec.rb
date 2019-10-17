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
        click_on 'Add friend'
        expect(page).to have_content('Request sent')
    end
end