require 'company_details_reader'

describe CompanyDetailsReader do
  let(:reader)      { CompanyDetailsReader.new('AAPL')                           }
  let(:request_uri) { (CompanyDetailsReader::BASE_URI + reader.ticker_code).to_s }

  it 'is initialized with a ticker code' do
    expect(reader.ticker_code).to eq 'AAPL'
  end

  it 'can make a GET request to an external web service' do
    response = double :response
    expect(HTTParty).to receive(:get).with(request_uri).and_return(response)
    expect(response).to receive(:body)
    reader.retrieve_data
  end
end