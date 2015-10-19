require 'spec_helper'

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

    it 'has latest stories as "N/A"' do
      expect(company.latest_stories).to eq 'N/A'
    end

    it 'has time as "N/A"' do
      expect(company.as_of).to eq 'N/A'
    end
  end

  context 'after making api calls' do
    context 'company not found' do
      let(:company_not_available) { Company.new(name: 'John Doe', tickerCode: 'JDOE') }

      it 'has price "N/A"' do
        company_not_available.retrieve_data
        expect(company_not_available.latest_price).to eq 'N/A'
      end
    end

    context 'company found but with no link for stories news feed' do
      
    end

    context 'company found and all data is available' do
      
    end
  end
end