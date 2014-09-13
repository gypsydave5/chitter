class Chit

	include DataMapper::Resource

	property :id, Serial
	property :content, Text
	property :tags, String
	property :users, String

end