require 'sinatra'

class TechTest < Sinatra::Base
  get '/' do
    'Hello'
  end
end