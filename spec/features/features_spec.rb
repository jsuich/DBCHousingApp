require 'spec_helper'

feature 'user logs in through developer.devbootcamp.com' do
  scenario 'with valid email and password' do
    visit login_path
    click_link "Login"
    expect(page).to have_content('Please Authenticate')
    sign_up_with '', ''
    expect(page).to have_content('DBC Housing Hub')
  end

  # scenario 'with invalid email' do
  #   sign_up_with 'invalid_email', 'password'

  #   expect(page).to have_content('Sign in')
  # end

  # scenario 'with blank password' do
  #   sign_up_with 'valid@example.com', ''

  #   expect(page).to have_content('Sign in')
  # end 
end

# feature 'user adds location' do


# end


# feature 'users marker is displayed on the map' do


# end


# feature 'users information is displayed in the pop up' do


# end