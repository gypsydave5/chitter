require 'data_mapper'
require './app/helpers/data_mapper_setup.rb'


task :default, :auto_upgrade do
	DataMapper.auto_upgrade!
	puts "Auto-upgrade done (no data loss)"
end

task :auto_migrate do
	DataMapper.auto_migrate!
	puts "Auto-migrate done (data may be lost)"
end
