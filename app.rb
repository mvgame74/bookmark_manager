require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  attr_reader :bookmarks
  
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/new' do
    erb :new
  end
  
  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end
 
  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  delete '/bookmarks/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("DELETE FROM bookmarks WHERE id = #{params['id']}")
    redirect '/bookmarks'
  end

  run! if app_file == $0
end