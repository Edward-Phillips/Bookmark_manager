require 'pg'

class Bookmark
  attr_reader :name, :address

  def initialize(who: "nobody", where: "nowhere")
    @name = who
    @address = where
  end
  def self.all
    self.connect
    rs = @con.exec "SELECT * FROM bookmarks"
    list =[]
    rs.map { |row| list.push(Bookmark.new(where: row['url'], who: row['title']))}
  end

  def self.create(url:, title:)
    self.connect
    @con.exec("INSERT INTO bookmarks (url,title) VALUES('#{url}','#{title}')")
  end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      @con = PG.connect :dbname => 'bookmark_manager_test', :user => 'edwardphillips'
    else 
      @con = PG.connect :dbname => 'bookmark_manager', :user => 'edwardphillips'
    end
  end
end