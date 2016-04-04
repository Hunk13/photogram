require 'rails_helper.rb'

feature 'Creating Post' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/coffee.jpg')
    fill_in 'Caption', with: 'nom nom nom #coffetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  it 'needs an image on create post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'No picture because YOLO'
    click_button 'Create Post'
    expect(page).to have_content('Halt, you fiend! You need an image to post here!')
  end

  it "won't update a post without an image" do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/coffee.zip')
    fill_in 'Caption', with: 'nom nom nom #coffetime'
    click_button 'Create Post'
    expect(page).to have_content('Halt, you fiend! You need an image to post here!')
  end

end
