require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    'Test page'
  end

  get '/posts' do
    @posts = Chitter.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/posts' do
    Chitter.create(message: params[:message])
    redirect '/posts'
  end

  run! if app_file == $0
end