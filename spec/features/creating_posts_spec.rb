require 'rails_helper.rb'

feature 'Creating Post' do
  before do
    visit '/'
    click_link 'New Post'
  end
  scenario 'can create a post' do
    attach_file('Image', 'spec/files/images/coffee.jpg')
    fill_in 'Caption', with: 'nom nom nom #coffetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  scenario 'needs an image on create post' do
    fill_in 'Caption', with: 'No picture because YOLO'
    click_button 'Create Post'
    expect(page).to have_content('Halt, you fiend! You need an image to post here!')
  end

  scenario "won't update a post without an image" do
    attach_file('Image', 'spec/files/images/coffee.zip')
    fill_in 'Caption', with: 'nom nom nom #coffetime'
    click_button 'Create Post'
    expect(page).to have_content("Halt, you fiend! You need an image to post here!")
  end

end
