require 'rails_helper'

describe "adding and deleting photos" do 
  it "adds a new photo" do 
    go_home
    create_a_new_user

    upload_photo
    expect(page).to have_content "Uploaded successfully!"
  end

  it 'goes to photo show page' do 
    create_and_go_to_photo
    expect(page).to have_content 'Tags:'
  end

  it 'deletes a photo' do 
    create_and_go_to_photo

    photo = Photo.first
    click_on "delete_#{photo.id}"
    expect(page).to have_content "Photo Deleted"
  end
end

describe "tags a user in a photo" do 
  it "adds and delete tags" do 
    create_and_go_to_photo

    user = User.first
    find(:css, "#tag_user_id_#{user.id}").set(true)
    click_on "Tag"
    expect(page).to have_content "(x)"

    click_link "(x)"
    expect(page).to_not have_content "(x)"
  end
end

def create_and_go_to_photo
  go_home
  create_a_new_user
  upload_photo
  go_to_photo_page
end

def go_to_photo_page
  photo = Photo.first
  click_link "photo_#{photo.id}"
end

def upload_photo
  click_on 'upload'
  attach_file('photo_photo', File.absolute_path('tz6.jpg'))
  fill_in 'photo_name', with: 'testphoto'
  click_on 'Upload Photo'
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
