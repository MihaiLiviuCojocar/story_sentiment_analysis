describe CompanyNewsFeedRader do
  let(:uri)    { 'some_uri'                    }
  let(:reader) { CompanyNewsFeedRader.new(uri) }

  it 'is initialized with an uri' do
    expect(reader.uri).to eq 'some_uri'
  end

  it 'can make a GET request to an external web service' do
    response = double :response
    expect(HTTParty).to receive(:get).with(uri).and_return(response)
    expect(response).to receive(:body)
    reader.retrieve_data
  end
end