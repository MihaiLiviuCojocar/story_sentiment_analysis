describe CompanyDetailsReader do
  let(:reader)      { CompanyDetailsReader.new('AAPL')                           }
  let(:request_uri) { (CompanyDetailsReader::BASE_URI + reader.ticker_code).to_s }

  it 'is initialized with a ticker code' do
    expect(reader.ticker_code).to eq 'AAPL'
  end

  it 'retrieves the body of the response given a status code 200' do
    stub_request(
          :any,
          'http://mm-recruitment-stock-price-api.herokuapp.com/company/AAPL')
        .to_return(File.new('spec/fixtures/requests/company_with_story_feed.txt'))
          
    response = double :response, code: 200
    expect(HTTParty).to receive(:get).with(request_uri).and_return(response)
    expect(response).to receive(:body)

    reader.retrieve_data
  end

  it 'returns a json message "Not Found" given a code 404' do
    company_not_registered = 'JDOE'
    reader   = CompanyDetailsReader.new(company_not_registered)
    base_uri = CompanyDetailsReader::BASE_URI

    stub_request(
          :any,
          "http://mm-recruitment-stock-price-api.herokuapp.com/company/#{company_not_registered}")
        .to_return(File.new('spec/fixtures/requests/company_not_found.txt'))

    response = double :response, code: 404
    expect(HTTParty).to receive(:get).with(base_uri + reader.ticker_code).and_return(response)
    expect(response).not_to receive(:body)

    reader.retrieve_data
  end
end