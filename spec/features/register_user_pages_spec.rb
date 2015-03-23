require 'rails_helper'

describe 'the add user process' do

  it 'adds a new user with valid input' do
    go_home
    create_a_new_user
    expect(page).to have_content 'testuser1'
  end

  it 'adds a new user with invalid input' do
    go_home
    click_on 'Register'
    fill_in 'Username', with: 'testuser1'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create User'
    expect(page).to_not have_content 'testuser1'
  end

end

describe 'user sessions' do 
    it 'signs a user in on creation' do 
      go_home
      create_a_new_user
      expect(page).to have_content 'Logout'
    end

    it 'logs a user in and out' do 
      go_home
      create_a_new_user
      logout
      expect(page).to have_content 'Register'

      login
      expect(page).to have_content 'testuser1'
    end


    it 'has flash messages' do 
      go_home
      create_a_new_user
      expect(page).to have_content 'Registered successfully!'

      logout
      expect(page).to have_content 'Successfully logged out.'

      login
      expect(page).to have_content  'Successfully logged in'
    end
end



def create_a_new_user
  click_on 'Register'
  fill_in 'Username', with: 'testuser1'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  attach_file('user_avatar', File.absolute_path('tz6.jpg'))
  click_on 'Create User'
end

def go_home
  visit '/'
end

def login
  click_on 'Login'
  fill_in 'Username', with: 'testuser1'
  fill_in 'Password', with: 'password'
  click_button 'Login'
end

def logout
  click_on 'Logout'
end
