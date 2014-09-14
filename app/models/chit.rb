class Chit

	include DataMapper::Resource

	property :id, Serial
	property :content, Text
	property :date_stamp, Time
	belongs_to :user
	#has 0..1 :chit #for replies???

end