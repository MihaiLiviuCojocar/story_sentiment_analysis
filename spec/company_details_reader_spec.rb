require 'company_details_reader'

describe CompanyDetailsReader do
  it 'is initialized with a ticker code' do
    reader = CompanyDetailsReader.new('AAPL')
    expect(reader.ticker_code).to eq 'AAPL'
  end
end