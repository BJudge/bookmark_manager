ENV['RACK_ENV'] ||= 'development'

require_relative 'DB_setup'
require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'


  get '/' do
    redirect :'links/new'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      #tag = Tag.first_or_create(name: params[:tags])
      link.tags << Tag.create(name: tag)
    end
    #link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
      password: params[:password], confirm_password: params[:confirm_password])
    session[:user_id] = user.id
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
