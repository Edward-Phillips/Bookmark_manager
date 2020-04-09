require 'bookmark'

  describe Bookmark do
    context '#all' do 
      it 'Bookmark class responds to the all method' do
        expect(Bookmark).to respond_to :all 
      end   
      xit " should return an array when given the all method" do
        expect(Bookmark.all).to be_instance_of(Array)
      end
      xit " should return an array of bookmarks when given the all method" do
        expect(Bookmark.all).to all(be_instance_of(Bookmark))
      end
    end 
  # to see  if it is an array 
  # to see if they are bookmark instances 
  end

describe '.all' do
  it 'returns a list of bookmarks' do
    Bookmark.create(url:'http://www.makersacademy.com')
    Bookmark.create(url:'http://www.destroyallsoftware.com')
    Bookmark.create(url:'http://www.google.com')

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end

describe "create" do
  it " should save the created bookmark so that it can be accessed through #all method. " do
    Bookmark.create(url:'buh')
    expect(Bookmark.all).to include('buh')
  end
end

