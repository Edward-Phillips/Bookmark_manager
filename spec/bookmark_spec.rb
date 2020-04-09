require 'bookmark'

  describe Bookmark do
    context '#all' do 
      it 'Bookmark class responds to the all method' do
        expect(Bookmark).to respond_to :all 
      end   
      it " should return an array when given the all method" do
        expect(Bookmark.all).to be_instance_of(Array)
      end
      it " should return an array of bookmarks when given the all method" do
        expect(Bookmark.all).to all(be_instance_of(Bookmark))
      end
    end 
  # to see  if it is an array 
  # to see if they are bookmark instances 
  end

describe '.all' do
  it 'returns a list of bookmarks' do
    Bookmark.create(url:'http://www.makersacademy.com', title: 'the bootcamp')
    Bookmark.create(url:'http://www.destroyallsoftware.com', title: 'the anti-singularity')
    Bookmark.create(url:'http://www.google.com', title: 'accessory to evil')

    bookmarks = Bookmark.all
    urls = []
    bookmarks.each {|page| urls.push(page.address) }

    expect(urls).to include('http://www.makersacademy.com')
    expect(urls).to include('http://www.destroyallsoftware.com')
    expect(urls).to include('http://www.google.com')
  end
end

describe "create" do
  it " should save the created bookmark so that it can be accessed through #all method. " do
    Bookmark.create(url: 'http://www.buh.com', title: 'hub')
    expect(Bookmark.all[-1].address).to eq('http://www.buh.com')
  end
end

describe "url checking" do
  it " should return true if the URL is a valid URL format" do
    expect(Bookmark.good_url?('http://www.google.com')).to eq(true)
  end
  it " should return false if the URL is an invalid URL format" do
    expect(Bookmark.good_url?('bad_url_format')).to eq(false)
  end
end

describe "deleting bookmarks" do
  it " should be able to delete a bookmark" do
    Bookmark.create(url:'http://www.makersacademy.com', title: 'the bootcamp')
    bookmark = Bookmark.all[-1]
    Bookmark.delete(bookmark.id)
    expect(Bookmark.all).not_to include(bookmark)    
  end
end
