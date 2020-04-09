require 'pg'
require 'uri'

class Bookmark
  attr_reader :name, :address, :id

  def initialize(who: "nobody", where: "nowhere", id:)
    @id = id
    @name = who
    @address = where
  end
  def self.all
    self.connect
    rs = @con.exec "SELECT * FROM bookmarks"
    rs.map { |row| Bookmark.new(where: row['url'], who: row['title'], id: row['id'])}
    
  end

  def self.create(url:, title:)
    if self.good_url?(url)
      self.connect
      @con.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}','#{title}')")
    end
  end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      @con = PG.connect :dbname => 'bookmark_manager_test', :user => 'edwardphillips'
    else 
      @con = PG.connect :dbname => 'bookmark_manager', :user => 'edwardphillips'
    end
  end

def self.good_url?(url)
  uri = URI.parse(url)
  uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
  false
end
end