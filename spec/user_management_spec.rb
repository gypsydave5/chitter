require 'spec_helper'

describe 'user management model' do

	context 'sign up' do

		it 'can create a new user' do
			expect{ new_user }.to change(User, :count).by(1)
			expect(User.first.email).to eq("bob@bob.com")
		end

		it 'cannot create user with password shorter than 6' do
			expect{ new_user(
				"bob@bob.com",
				"bob",
				"",
				"") }.to change(User, :count).by(0)
		end

		it 'cannot create user with password mismatch' do
			expect{ new_user(
				"bob@bob.com",
				"bob",
				"123x56") }.to change(User, :count).by(0)
		end

		it 'username is unique' do
			new_user
			expect{ new_user(
				"daryl@eightiesfilms.com",
				"bob",
				"123456",
				"123456") }.to change(User, :count).by(0)
		end

		it 'username is required' do
			new_user
			expect{ new_user(
				"daryl@eightiesfilms.com", "" ) }.to change(User, :count).by(0)
		end

		it 'email is unique' do
			new_user
			expect{ new_user(
				"bob@bob.com",
				"cederic" ) }.to change(User, :count).by(0)
		end

		it 'email is required' do
			new_user
			expect{ new_user("") }.to change(User, :count).by(0)
		end

		it 'email is a valid email address' do
			new_user
			expect{ new_user(
				"fandabbydoozie",
				"cederic") }.to change(User, :count).by(0)
		end

	end

	context 'logging in' do

		it 'authenticates if the password is correct' do
			new_user
			authentic_user = User.authenticate('bob', '123456')
			expect(authentic_user.email).to eq 'bob@bob.com'
		end

		it 'does not authenticate if the password is incorrect' do
			new_user
			authentic_user = User.authenticate('bob', 'wrong_password')
			expect(authentic_user).to eq nil
		end

	end

	def new_user(
		email = "bob@bob.com",
		username = "bob",
		password = "123456",
		password_confirmation = "123456"
						 )
		User.create(
			email: email,
			username: username,
			password: password,
			password_confirmation: password_confirmation
		)
	end

end
