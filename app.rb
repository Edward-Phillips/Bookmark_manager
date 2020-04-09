require 'sinatra'
require './lib/bookmark'
class Bookmarker < Sinatra::Base
  enable :sessions
  get '/' do
    erb(:index)
  end
  run! if app_file == $0

  get '/bookmarks' do 
    @list = Bookmark.all.join(' <br>')
    erb(:bookmarks)
  end 

  get '/bookmarks/new' do
    p params
    p "Form Submitted to the /bookmarks route!"
    erb(:bookmark_entry)
  end

  post '/bookmarks' do
    url = params['url']
  connection = PG.connect(dbname: 'bookmark_manager')
  connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  redirect '/bookmarks'
  end
end
