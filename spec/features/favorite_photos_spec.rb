require 'rails_helper'

describe 'favorite photo process'  do
  it 'favorite a photo' do
    user = FactoryGirl.create(:user, :id => 1)
    login_as(user, :scope => :user)
    photo = create(:photo)
    visit user_photo_path(photo.owner_id, photo)
    find_by_id('great').click
    expect(page).to have_content("Likes: 0")
    end
  end
