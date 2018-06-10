require 'rails_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    user = create :user
    sign_in_with user
    post = create(:post, user_id: user.id, id: 1)

    visit root_path
    visit browse_posts_path
    first(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
