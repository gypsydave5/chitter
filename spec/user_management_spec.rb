require 'spec_helper'

feature 'Users' do

	scenario 'can create a new user' do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(User.first.email).to eq("bob@bob.com")
	end

	scenario 'cannot create user with password shorter than 6' do
		expect{ sign_up(
			"bob@bob.com",
			"bob",
			"",
			"") }.to change(User, :count).by(0)
	end

	scenario 'cannot create user with password mismatch' do
		expect{ sign_up(
			"bob@bob.com",
			"bob",
			"123456",
			"123458") }.to change(User, :count).by(0)
	end

	scenario 'username is unique' do
		sign_up
		expect{ sign_up(
			"daryl@eightiesfilms.com",
			"bob",
			"123456",
			"123456") }.to change(User, :count).by(0)
	end

	scenario 'username is required' do
		sign_up
		expect{ sign_up(
			"daryl@eightiesfilms.com",
			"",
			"123456",
			"123456") }.to change(User, :count).by(0)
	end

	scenario 'email is unique' do
		sign_up
		expect{ sign_up(
			"bob@bob.com",
			"cederic",
			"123456",
			"123456") }.to change(User, :count).by(0)
	end

	scenario 'email is required' do
		sign_up
		expect{ sign_up(
			"",
			"cederic",
			"123456",
			"123456") }.to change(User, :count).by(0)
	end

	scenario 'email is a valid email address' do
		sign_up
		expect{ sign_up(
			"fandabbydoozie",
			"cederic",
			"123456",
			"123456") }.to change(User, :count).by(0)
	end

	def sign_up(email = "bob@bob.com",
							username = "bob",
							password = "123456",
							password_confirmation = "123456"
						 )
		visit '/users/new'
		expect(page.status_code).to eq(200)
		fill_in :email, :with => email
		fill_in :username, :with => username
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button "Join Chitter"
	end

end
