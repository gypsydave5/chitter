class Chitter
	get '/chits/new' do
		haml :"chits/new"
	end

	post '/chits' do
		chit = Chit.new( content: params[:chit_content],
										user: current_user )
		chit.save
		flash[:errors] = chit.errors.full_messages
		redirect to ('/')
	end
end
