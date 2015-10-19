require 'httparty'

class CompanyDetailsReader
  BASE_URI = 'http://mm-recruitment-stock-price-api.herokuapp.com/company/'
  attr_reader :ticker_code

  def initialize(ticker_code)
    @ticker_code = ticker_code
    self
  end

  def retrieve_data
    response = HTTParty.get(BASE_URI + ticker_code)
    if response.code != 404
      response.body
    else
      { "message": "Not Found" }.to_json
    end
  end
end