require 'rails_helper.rb'
feature 'Creating a new user' do  
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'can create a new user via the index page' do
    fill_in 'Email', with: 'stream@example.com'
    fill_in 'Username', with: 'stream'
    fill_in 'Password', with: 'qwerty', match: :first
    fill_in 'Password confirmation', with: 'qwerty'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
   end
  scenario 'requires username to create account' do
    fill_in 'Email', with: 'stream@example.com'
    fill_in 'Password', with: 'qwerty', match: :first
    fill_in 'Password confirmation', with: 'qwerty'
    click_button 'Sign up'
    expect(page).to have_content "can't be blank"
  end
end