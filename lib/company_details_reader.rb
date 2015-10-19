require 'httparty'

class CompanyDetailsReader
  BASE_URI = 'http://mm-recruitment-stock-price-api.herokuapp.com/company/'
  attr_reader :ticker_code

  def initialize(ticker_code)
    @ticker_code = ticker_code
  end

  def retrieve_data
    HTTParty.get(BASE_URI + ticker_code)
  end
end