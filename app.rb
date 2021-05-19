require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks/new' do
    erb :"/bookmark/new"
  end

  post '/bookmarks/new' do
    p params
    p "Form data submitted to the /bookmarks route!"
  end
 
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end