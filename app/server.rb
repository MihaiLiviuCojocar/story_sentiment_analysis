require 'sinatra'
require './db_config/env'

class TechTest < Sinatra::Base
  get '/' do
    'Hello'
  end
end