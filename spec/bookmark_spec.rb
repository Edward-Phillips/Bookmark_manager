require 'bookmark'

  describe Bookmark do
    context '#all' do 
      it 'Bookmark class responds to the all method' do
        expect(Bookmark).to respond_to :all 
      end   
      it " should give me an array when given the all method" do
        expect(Bookmark.all).to be_instance_of(Array)
      end
    end 
  # to see  if it is an array 
  # to see if they are bookmark instances 
end