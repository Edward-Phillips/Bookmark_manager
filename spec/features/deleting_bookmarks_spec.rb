feature "deleting bookmarks: " do
  scenario "I can delete a bookmark" do
    Bookmark.create(url:'http://www.makersacademy.com', title: 'the bootcamp')
    visit('/')
    click_button('Delete Bookmark')
    fill_in('id', :with => 1)
    click_button('Delete!')
    expect(page).to have_current_path('/bookmarks')
    expect(page).not_to have_content('the bootcamp')
  end
end