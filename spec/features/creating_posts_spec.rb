require 'rails_helper.rb'

feature 'Creating post' do
  background do
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'stream@example.com'
    fill_in 'Username', with: 'stream'
    fill_in 'Password', with: 'qwerty', match: :first
    fill_in 'Password confirmation', with: 'qwerty'
    click_button 'Sign up'
    click_link 'New Post'
  end
  scenario 'can create post' do
    attach_file('Image', 'spec/files/images/coffee.jpg')
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content '#coffeetime'
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  scenario 'nees an image to create post' do
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content 'Something wrong! Please check the form!'
  end
end