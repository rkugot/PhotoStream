require 'rails_helper.rb'

feature 'Creating post' do
  scenario 'can create post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/coffee.jpg')
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content '#coffeetime'
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  scenario 'nees an image to create post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'nom nom nom #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content 'Something wrong! Please check the form!'
  end
end