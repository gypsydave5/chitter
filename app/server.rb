require 'data_mapper'
require 'haml'
require 'sinatra/base'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, 'postgres://localhost/chitter_#{env}')

class Chitter < Sinatra::Base

  get '/' do
		haml :index
  end

	get '/users/new' do
		haml :"users/new"
	end

	post '/users/new/submit' do

	end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
