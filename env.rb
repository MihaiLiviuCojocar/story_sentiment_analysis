require 'mongoid'

env = ENV['RACK_ENV'] || 'development'

Mongoid.load!('./mongoid.yml', env)