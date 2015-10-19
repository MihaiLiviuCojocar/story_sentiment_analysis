class CompanyDetailsReader
  attr_reader :ticker_code

  def initialize(ticker_code)
    @ticker_code = ticker_code
  end
end