class Chitter
	get '/sessions/new' do
		haml :"sessions/new"
	end

	post '/sessions' do
		username, password = params[:username], params[:password]
		user = User.authenticate(username, password)
		if user
			session[:user_id] = user.id
			redirect to ('/')
		else
			flash[:errors] = ["Incorrect username or password"]
			redirect to('/sessions/new')
		end
	end

	delete '/sessions' do
		session[:user_id] = nil
		flash[:notice] = "Be seeing you"
		redirect to ('/')
	end
end
