require 'rails_helper'

feature 'Creating Comments' do
  scenario 'can comment on an existing post' do
    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with user

    visit '/'
    click_link 'Browse Posts'
    fill_in "comment_content_#{post.id}", with: ';P'
    click_button 'Submit'

    # temporary
    click_link 'Browse Posts'

    expect(page).to have_content(';P')
  end
end
