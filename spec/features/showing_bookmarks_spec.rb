feature "showing bookmarks" do
  scenario "should be able to view bookmarks from home page" do
    visit('/')
    expect(page).to have_button('View Bookmarks')
  end
  scenario "clicking 'View bookmarks' button should take you to page '/bookmarks" do
    visit('/')
    click_button 'View Bookmarks'
    expect(page).to have_current_path('/bookmarks')
  end 
  scenario " '/bookmarks' page should list all bookarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'The bootcamp');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'the anti singularity');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google, good old google');")
    visit('/')
    click_button 'View Bookmarks'
    expect(page).to have_content('The bootcamp')
  end
end