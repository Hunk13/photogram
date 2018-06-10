require 'rails_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    user = create :user
    sign_in_with user
    post = create :post

    visit browse_posts_path
    find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
    expect(page.current_path).to eq(post_path(post))
  end
end
