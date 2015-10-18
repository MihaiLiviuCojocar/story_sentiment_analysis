require 'mongoid'
require './app/models/company'

env = ENV['RACK_ENV'] || 'development'

puts "Connected to the #{env} database."

Mongoid.load!(File.expand_path("./db_config/mongoid.yml"), env)
Mongo::Logger.logger.level = ::Logger::FATAL
