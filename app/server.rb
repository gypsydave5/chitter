require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'haml'
require_relative './models/chit.rb'
require_relative './models/user.rb'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_migrate!

class Chitter < Sinatra::Base

	use Rack::Flash
	enable :sessions
	set :session_secret, 'amaze'

  get '/' do
		haml :index
  end

	get '/users/new' do
		@user = User.new
		haml :"users/new"
	end

	post '/users/new' do
		@user = User.new(
			email: params[:email],
			username: params[:username],
			password: params[:password],
			password_confirmation: params[:password_confirmation]
		)
		if @user.save
			session[:user_id] = @user.id
			redirect to ('/')
		else
			flash[:errors] = @user.errors.full_messages
			haml :"users/new"
		end
	end

	helpers do

		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end
	end


  # start the server if ruby file executed directly
  run! if app_file == $0

end
