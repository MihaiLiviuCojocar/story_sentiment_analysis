require 'sinatra'
require 'tilt/haml'
require './db_config/env'

class TechTest < Sinatra::Base
  get '/' do
    @companies = Company.all.to_a
    haml :"companies/index"
  end

  get '/companies/:ticker_code' do
    @company = Company.where(tickerCode: params[:ticker_code]).first
    @company.retrieve_data
    haml :"companies/show"
  end
end