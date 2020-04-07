require 'pg'

class Bookmark
  attr_reader :name, :address

  def initialize(who: "nobody", where: "nowhere")
    @name = who
    @address = where
  end
  def self.all
    @bookmarks =[Bookmark.new(where:"links",who:"bookmark one"),Bookmark.new(where:"link",who:"bookmark_two")]
  end

  def self.new_bookmark(me, there)
    @bookmarks.push(Bookmark.new(who:me,where:there))
  end
end