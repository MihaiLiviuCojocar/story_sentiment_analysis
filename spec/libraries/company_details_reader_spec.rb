describe CompanyDetailsReader do
  let(:reader)      { CompanyDetailsReader.new('AAPL')                           }
  let(:request_uri) { (CompanyDetailsReader::BASE_URI + reader.ticker_code).to_s }

  it 'is initialized with a ticker code' do
    expect(reader.ticker_code).to eq 'AAPL'
  end

  it 'can make a GET request to an external web service' do
    stub_request(
          :any,
          'http://mm-recruitment-stock-price-api.herokuapp.com/company/AAPL')
        .to_return(File.new('spec/fixtures/requests/company_with_story_feed.txt'))
          
    # need to come back to this
    reader.retrieve_data
  end
end