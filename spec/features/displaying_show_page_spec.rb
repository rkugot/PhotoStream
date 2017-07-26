require 'rails_helper.rb'

feature 'Can view individual post' do
  scenario 'showing post after click on image' do
    post = create(:post, caption: 'This is my post')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_current_path(post_path(post))
  end
end

