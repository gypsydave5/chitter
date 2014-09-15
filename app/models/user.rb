require 'bcrypt'

class User

	include DataMapper::Resource


	property :id, Serial
	property :email, String, unique: true, required: true, format: :email_address,
		messages: {
		is_unique: "That email address is already in use - have you forgotten your password?"
	}
	property :username, String, unique: true, required: true
	property :password_digest, Text
	has n, :chits

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password
	validates_length_of :password, min: 6, if: :new?, message: "Password must be a minium of six characters long"

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(username, password)
		user = User.first( username: username )
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end

end