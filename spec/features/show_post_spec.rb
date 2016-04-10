require 'rails_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    user = create :user
    post = create :post
    sign_in_with user

    find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
    expect(page.current_path).to eq(post_path(post))
  end
end
