require 'rails_helper'

describe 'sign up path process'  do
  it 'sign up people' do
    visit new_user_registration_path
    fill_in "Name", :with => "Cody"
    fill_in "Email", :with => "email@email.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button 'Sign up'
    expect(page).to have_content("email@email.com")
  end

  it 'will update user account' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path
    fill_in "Email", :with => "email@email.com"
    fill_in "Current password", :with => "123123"
    click_button "Update"
    expect(page).to have_content("email@email.com")
  end
end
