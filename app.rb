require 'sinatra'
require './lib/bookmark'
class Bookmarker < Sinatra::Base
  enable :sessions
  get '/' do
    erb(:index)
  end
  run! if app_file == $0

  get '/bookmarks' do 
    @list = Bookmark.all.join("\n")
    erb(:bookmarks)
  end 

  get 'bookmarks/new' do
    erb(:bookmark_entry)
  end
end
