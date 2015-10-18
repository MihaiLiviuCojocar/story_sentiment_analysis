require 'spec_helper'

describe Company do
  let(:company) { Company.new(name: 'Apple Inc', tickerCode: 'APPL') }

  it 'has a name' do
    expect(company.name).to eq 'Apple Inc'
  end

  it 'has a ticker code' do
    expect(company.tickerCode).to eq 'APPL'
  end
end