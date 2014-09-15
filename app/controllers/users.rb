class Chitter
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
			flash.now[:errors] = @user.errors.full_messages
			haml :"users/new"
		end
	end
end
