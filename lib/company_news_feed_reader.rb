class CompanyNewsFeedRader
  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def retrieve_data
    HTTParty.get(uri).body
  end
end