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
  scenario " the new saved bookmark should be visible on the view bookmarks page" do
    visit('/')
    click_button('Create Bookmarks')
    fill_in('url', :with => 'HTTP://HALLO.COM')
    click_button('Save New Bookmark')
    expect(page).to have_content('HTTP://HALLO.COM')
  end
end

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end