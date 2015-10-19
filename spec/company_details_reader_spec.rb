require 'company_details_reader'

describe CompanyDetailsReader do
  let(:reader) { CompanyDetailsReader.new('AAPL') }

  it 'is initialized with a ticker code' do
    expect(reader.ticker_code).to eq 'AAPL'
  end

  it 'can make a GET request to an external web service' do
    expect(HTTParty).to receive(:get).with(
      "#{CompanyDetailsReader::BASE_URI}" + reader.ticker_code)
    reader.retrieve_data
  end
end