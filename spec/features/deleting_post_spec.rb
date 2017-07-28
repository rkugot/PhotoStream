require 'rails_helper.rb'

feature 'Deleting post' do
  scenario 'can delete post' do
    user = create(:user)
    post = create(:post, caption: 'Post for deleting')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Delete'
    expect(page).to have_current_path(root_path)
    expect(page).to_not have_content('Post for deleting')
  end
end