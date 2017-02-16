require 'rails_helper'

describe 'the photos path' do
  it 'will add a photo' do
    user = create(:user)
    login_as(user)
    visit new_photo_path
    attach_file "photo_image", "spec/asset_specs/photos/bob.jpg"
    click_button "Create Photo"
    expect(page).to have_selector("img")
  end
end
