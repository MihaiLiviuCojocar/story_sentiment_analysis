require 'sinatra'
require 'tilt/haml'
require './db_config/env'

class TechTest < Sinatra::Base
  get '/' do
    @companies = Company.all.to_a
    haml :"companies/index"
  end
end