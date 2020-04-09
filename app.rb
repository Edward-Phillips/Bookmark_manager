require 'sinatra'
require './lib/bookmark'
class Bookmarker < Sinatra::Base
  enable :sessions, :method_override

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
    @bookmarks = Bookmark.all
    erb(:bookmark_removal)
  end

  delete '/bookmarks/:id' do
    p params
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end
end
