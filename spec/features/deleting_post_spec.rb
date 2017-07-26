require 'rails_helper.rb'

feature 'Deleting post' do
  scenario 'can delete post' do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Delete'
    expect(page).to have_current_path(root_path)
  end
end