feature 'Creating bookmarks' do
  scenario "should be able to choose to create bookmarks from the home page" do
    visit('/')
    expect(page).to have_button('Create bookmarks')
  end
end