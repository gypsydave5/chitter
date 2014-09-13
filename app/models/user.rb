require 'bcrypt'

class User

	include DataMapper::Resource


	property :id, Serial
	property :email, String, unique: true, required: true, format: :email_address
	property :username, String, unique: true, required: true
	property :password_digest, Text

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password
	validates_length_of :password, min: 6, message: "Password must be a minium of six characters long"

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

end