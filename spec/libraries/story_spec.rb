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

  context 'sentiment analysis' do
    it 'returns a positive sentiment analysis given a score of 2' do
      allow(story).to receive(:positivity_score).and_return(2)
      expect(story.sentiment_analysis).to eq :positive
    end

    it 'returns a neutral sentiment analysis given a score of 1' do
      allow(story).to receive(:positivity_score).and_return(1)
      expect(story.sentiment_analysis).to eq :neutral
    end

    it 'returns a negative sentiment analysis given a score of -1' do
      allow(story).to receive(:positivity_score).and_return(-1)
      expect(story.sentiment_analysis).to eq :negative
    end
  end

  context 'unicode for sentiment face' do
    it 'returns the unicode for a smile face given a positive sentiment' do
      story = Story.new(id: 12, headline: 'Some headline', body: 'positive healthy grow')
      expect(story.sentiment_face_unicode).to eq '&#128516;'
    end

    it 'returns the unicode for a neutral face given a neutral sentiment' do
      story = Story.new(id: 12, headline: 'Some headline', body: 'some neutral words')
      expect(story.sentiment_face_unicode).to eq '&#128528;'
    end

    it 'returns the unicode for a frowning face given a negative sentiment' do
      story = Story.new(id: 12, headline: 'Some headline', body: 'dissapointing decline')
      expect(story.sentiment_face_unicode).to eq '&#128550;'
    end
  end
end