feature 'Creating bookmarks' do
  scenario "should be able to choose to create bookmarks from the home page" do
    visit('/')
    expect(page).to have_button('Create Bookmarks')
  end
  scenario "clicking create bookmarks should take you to a page to enter in the bookmark" do
    visit('/')
    click_button('Create Bookmarks')
    expect(page).to have_current_path('/bookmarks/new')
  end
  scenario "clicking create bookmarks should take you to a page to enter in the bookmark PART 2" do
    visit('/')
    click_button('Create Bookmarks')
    expect(page).to have_field('url')
  end
end