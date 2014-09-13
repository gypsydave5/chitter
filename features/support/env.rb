
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/server.rb')

DataMapper.auto_migrate!
require 'database_cleaner'

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = Chitter

class ChitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with(:truncation)

Before do
    DatabaseCleaner.start
end

After do
    DatabaseCleaner.clean
end

World do
  ChitterWorld.new
end
