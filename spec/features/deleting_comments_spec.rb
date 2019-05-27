require 'rails_helper'

feature 'Deleting comments' do
  background do
    user = create(:user, email: 'hi@hi1.com', user_name: 'bigrigoz_one')
    user_two = create(:user, email: 'hi@hi2.com', user_name: 'bigrigoz_two')
    post = create :post, user: user
    comment = create(:comment, user: user_two, post: post)
    comment_two = create(:comment, post: post, content: 'You guys are too kind xo')
    sign_in_with user_two
  end
  scenario 'user can delete their own comments' do
    visit '/'
    click_link 'Browse Posts'
    expect(page).to have_content('Nice post!')
    click_link 'delete-2'
    expect(page).to_not have_content('Nice post!')
  end

  scenario 'user cannot delete a comment not belonging to them via the ui' do
    visit '/'
    click_link 'Browse Posts'
    expect(page).to have_content('You guys are too kind xo')
    expect(page).to_not have_css('#delete-2')
  end
end
