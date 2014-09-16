require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'haml'
require 'sinatra/partial'

require_relative './models/chit.rb'
require_relative './models/user.rb'

require_relative './helpers/data_mapper_setup.rb'
require_relative './helpers/sinatra_helpers.rb'

class Chitter < Sinatra::Base

	include ChitterHelpers

	register Sinatra::Partial
	use Rack::Flash
	use Rack::MethodOverride
	enable :sessions
	set :session_secret, 'amaze'

  run! if app_file == $0

end

require_relative './controllers/application.rb'
require_relative './controllers/users.rb'
require_relative './controllers/sessions.rb'
require_relative './controllers/chits.rb'

