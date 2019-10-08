module Helpers
  def register_user
    visit '/users/sign_up'
    fill_in 'First name', with: 'Uche'
    fill_in  'Surname', with: 'Inyama'
    fill_in  'Email', with: 'uac@gmail.com'
    fill_in  'Password', with: '1234asdf'
    fill_in  'Password confirmation', with: '1234asdf'
    page.find('#user_date_of_birth').set('2000-10-04')
    select('Male', from: 'user_gender')
    click_button 'Sign up'
    click_on 'Sign out'
  end

  def sign_in_user
    visit '/users/sign_in'
    fill_in 'Email', with: 'uac@gmail.com'
    fill_in 'Password', with: '1234asdf'
    click_button 'Log in'
  end
end