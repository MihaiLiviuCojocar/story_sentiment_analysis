require 'story'

describe Story do
  let(:story) { Story.new(id: 12, headline: 'Some headline', body: 'Some text body') }

  it 'has an id' do
    expect(story.id).to eq 12
  end

  it 'has a headline' do
    expect(story.headline).to eq 'Some headline'
  end

  it 'has a body' do
    expect(story.body).to eq 'Some text body'
  end
end