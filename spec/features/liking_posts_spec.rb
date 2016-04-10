require 'rails_helper'

feature 'linking post' do
  background do
    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with user

    visit '/'
  end

  scenario 'can like a post' do
    click_link 'like_1'

    # Expect to see a "liked-post" class appear for the button (the button will turn solid red aka Instagram).
    # Expect to see my name within the "liked by" area of the post.
  end

  scenario 'can unlike a post' do
    # Repeat the above steps.
    # Click the "like" button once more.
    # Expect to see the "unlikes-post" class on the button.
    # Expect to NOT see my name within the "liked by" area of the post
  end
end
