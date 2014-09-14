require 'spec_helper'

feature Chit do

	let(:dummy_user) {
		User.create(
			username: 'bob',
			email: 'bob@bob.com',
			password: '123456',
			password_confirmation: '123456'
		)
	}

	scenario 'chits can be created' do
		expect{ new_chit }.to change(Chit, :count).by(1)
	end

	xit 'chits extract hashtags from their content'

	xit 'chits can be replies to other chits'

	xit 'chits have a character limit of 140'

	xit 'chits are time stamped with their creation time'

	def new_chit( content='My first chit', user=dummy_user )
		Chit.create( content: content, user: user )
	end

end