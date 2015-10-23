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
      smile_face_unicode = Story::SENTIMENT_FACES[:positive]
      expect(story.sentiment_face_unicode).to eq smile_face_unicode
    end

    it 'returns the unicode for a neutral face given a neutral sentiment' do
      story = Story.new(id: 12, headline: 'Some headline', body: 'some neutral words')
      neutral_face_unicode = Story::SENTIMENT_FACES[:neutral]
      expect(story.sentiment_face_unicode).to eq neutral_face_unicode
    end

    it 'returns the unicode for a frowning face given a negative sentiment' do
      story = Story.new(id: 12, headline: 'Some headline', body: 'dissapointing decline')
      frowning_face_unicode = Story::SENTIMENT_FACES[:negative]
      expect(story.sentiment_face_unicode).to eq frowning_face_unicode
    end
  end
end
