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

describe "I'm a data scientist now!" do
  context " So I can do all sorts of stuff wiht my bookmarks database:" do
    let (:mylist) {Bookmark.all}
    it " 1 - I can get all those booknmarks I had from before!" do
      expect(mylist).to include("http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com")
    end
  end
end
