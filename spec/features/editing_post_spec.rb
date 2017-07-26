require 'rails_helper.rb'

feature 'Editing post' do

  background do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit'
  end

  scenario 'can edit post' do
    fill_in 'Caption', with: 'Super new editing post'
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content('Super new editing post')
  end

  scenario "won't update a post without image" do
    attach_file('Image', 'spec/files/images/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content('Update failed.  Please check the form.')
  end

end