require 'sinatra'
require './lib/bookmark'
class Bookmarker < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end
  run! if app_file == $0

  get '/bookmarks' do 
    @list = Bookmark.all
    erb(:bookmarks)
  end 

  get '/bookmarks/new' do
    erb(:bookmark_entry)
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  get '/bookmarks/delete' do
    erb(:bookmark_removal)
  end
  delete '/bookmarks' do
    
  end
end
