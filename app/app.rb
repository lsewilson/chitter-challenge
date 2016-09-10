require 'sinatra/base'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= 'development'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
