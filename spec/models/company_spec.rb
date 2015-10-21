describe Company do
  let(:company) { Company.new(name: 'Apple Inc', tickerCode: 'APPL') }

  it 'has a name' do
    expect(company.name).to eq 'Apple Inc'
  end

  it 'has a ticker code' do
    expect(company.tickerCode).to eq 'APPL'
  end

  context 'before making api calls for details' do
    it 'has price "N/A"' do
      expect(company.latest_price).to eq 'N/A'
    end

    it 'has latest stories empty' do
      expect(company.latest_stories).to eq []
    end

    it 'has time as "N/A"' do
      expect(company.as_of).to eq 'N/A'
    end
  end

  context 'after making api calls' do
    context 'when company not found' do
      let(:company_not_available) { Company.new(name: 'John Doe', tickerCode: 'JDOE') }

      before(:each) do
        stub_request(
          :any,
          'http://mm-recruitment-stock-price-api.herokuapp.com/company/JDOE')
        .to_return(File.new('spec/fixtures/requests/company_not_found.txt'), status: 404)
        company_not_available.retrieve_data
      end

      it 'has price "N/A"' do
        expect(company_not_available.latest_price).to eq 'N/A'
      end

      it 'has latest stories empty' do
        expect(company_not_available.latest_stories).to eq []
      end

      it 'has time as "N/A"' do
        expect(company_not_available.as_of).to eq 'N/A'
      end
    end

    context 'when company found but with no link for stories news feed' do
      let(:company) { Company.new(name: 'Apple Inc', tickerCode: 'AAPL') }

      before(:each) do
        stub_request(
          :any,
          'http://mm-recruitment-stock-price-api.herokuapp.com/company/AAPL')
        .to_return(File.new('spec/fixtures/requests/company_without_story_feed.txt'))
        company.retrieve_data
      end

      it 'has price set to the found value' do
        expect(company.latest_price).to eq 1945
      end

      it 'has price units set to found value' do
        expect(company.price_units).to eq 'GBP:pence'
      end

      it 'has story feed uri unidentified' do
        expect(company.story_feed_uri).to eq 'N/A'
      end

      it 'has the time set to found value' do
        expect(company.as_of).to eq 'Sun Oct 19 14:06:52 2014'
      end
    end

    context 'when company found and all data is available' do
      let(:company) { Company.new(name: 'Google Inc', tickerCode: 'GOOG') }

      before(:each) do
        stub_request(
          :any,
          'http://mm-recruitment-stock-price-api.herokuapp.com/company/GOOG')
        .to_return(File.new('spec/fixtures/requests/company_with_story_feed.txt'))

          stub_request(
            :any,
            'http://mm-recruitment-story-feed-api.herokuapp.com/8271')
          .to_return(File.new('spec/fixtures/requests/stories.txt'))

          company.retrieve_data
      end

      it 'has the story feed uri set to the found value' do
        expect(company.story_feed_uri).to eq 'http://mm-recruitment-story-feed-api.herokuapp.com/8271'
      end

      it 'sets the stories if there is a story feed uri' do
        expect(company.latest_stories).not_to eq []
      end
    end
  end
end