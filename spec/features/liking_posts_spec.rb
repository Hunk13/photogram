require 'rails_helper'

feature 'linking post' do
  background do
    user = create :user
    sign_in_with user
    post = create(:post, user_id: user.id, id: 1)

    visit root_path
    visit browse_posts_path
  end

  scenario 'can like a post' do
    click_link('like_1')
    expect(page).to have_css('a.glyphicon-heart')
    expect(find('.likes')).to have_content('Arnie')
  end

  scenario 'can unlike a post' do
    # Repeat the above steps.
    # Click the "like" button once more.
    # Expect to see the "unlikes-post" class on the button.
    # Expect to NOT see my name within the "liked by" area of the post
  end
end
