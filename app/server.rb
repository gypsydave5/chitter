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
	use Rack::MethodOverride
	enable :sessions
	set :session_secret, 'amaze'

	helpers do
		def current_user
			@current_user ||=User.get(session[:user_id]) if session[:user_id]
		end
	end

  # start the server if ruby file executed directly
  run! if app_file == $0

end

require_relative './controllers/application.rb'
require_relative './controllers/users.rb'
require_relative './controllers/sessions.rb'
require_relative './controllers/chits.rb'

