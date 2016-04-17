require 'rails_helper'

feature 'Index displays a list of posts' do
  background do
    post_one = create(:post, caption: 'This is first post')
    post_two = create(:post, caption: 'This is second post')

    user = create :user
    sign_in_with user
    click_link 'Browse Posts'
  end

  scenario 'the index displays correct created job information' do
    expect(page).to have_content('This is first post')
    expect(page).to have_content('This is second post')
    expect(page).to have_css("img[src*='coffee']")
  end
end
