require 'rails_helper'

feature 'Deleting Post' do
  background do
    user = create :user
    sign_in_with user
    create(:post, caption: 'Abs for days', user: user)

    click_link 'Browse Posts'
    find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
    click_link 'Edit Post'
  end

  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Problem solved! Post deleted.')
    expect(page).to_not have_content('Abs for days.')
  end
end
