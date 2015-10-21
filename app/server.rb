require 'sinatra'
require 'tilt/haml'
require './db_config/env'

class TechTest < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, "../public") }

  get '/' do
    @companies = Company.order_by(:name => 'asc')
    haml :"companies/index"
  end

  get '/companies/:ticker_code' do
    @company = Company.where(tickerCode: params[:ticker_code]).first
    @company.retrieve_data
    haml :"companies/show"
  end
end