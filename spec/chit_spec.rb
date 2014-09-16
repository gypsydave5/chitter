require 'spec_helper'
require 'timecop'

feature Chit do

	before do
		t = Time.local(1984,5,6,1,2,3)
		Timecop.freeze(t)
	end

	let(:dummy_user) {
		User.create(
			username: 'bob',
			email: 'bob@bob.com',
			password: '123456',
			password_confirmation: '123456'
		)
	}

	it 'can be created' do
		expect{ new_chit }.to change(Chit, :count).by(1)
	end

	xit 'chits extract hashtags from their content'

	xit 'chits can be replies to other chits'

	it 'chits have a character limit of 140' do
		expect { new_chit(long_message) }.to change(Chit, :count).by(0)
	end

	 it 'is time stamped with their creation time' do
		chit = new_chit
		t = Time.local(1984,5,6,1,2,3)
		expect(chit.created_at).to eq(t)
	end

	after do
		Timecop.return
	end

	def new_chit( content='My first chit', user=dummy_user )
		Chit.create( content: content, user: user )
	end

	def long_message
		"A really long string. Seriously long. You would not believe how long this string is. No, listen -- when your grandchildren ask you 'what is the longest string you have ever seen?', you're going to say this one. It's epic."
	end

end