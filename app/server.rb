require 'data_mapper'
require 'haml'
require 'sinatra/base'

env = ENV['RACK_ENV'] || 'development'

require_relative './models/chit.rb'
require_relative './models/user.rb'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_migrate!

class Chitter < Sinatra::Base

	enable :sessions
	set :session_secret, 'amaze'

  get '/' do
		haml :index
  end

	get '/users/new' do
		haml :"users/new"
	end

	post '/users' do
		user = User.create(
			email: params[:email],
			username: params[:username],
			password: params[:password],
			password_confirmation: params[:password_confirmation]
		)
		session[:user_id] = user.id
		redirect to ('/')
	end

	helpers do

		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end
	end


  # start the server if ruby file executed directly
  run! if app_file == $0

end
