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

  context 'positivity score calculation' do
    it 'calculates a positivity of 0 given 6 positive words and 6 negative words' do
      story = Story.new(
        id: 12,
        headline: 'Some headline',
        body: 'positive, success, grow, gains, happy, healthy,
              dissapointing, concerns, decline, drag, slump, feared')

      expect(story.positivity_score).to eq 0
    end

    it 'calculates a positivity of 0 given 6 positive words, 6 negative words and a few random words' do
      story = Story.new(
        id: 12,
        headline: 'Some headline',
        body: 'positive, success, grow, gains, happy, healthy,
              dissapointing, concerns, decline, drag, slump, feared,
              some, random, words')
      
      expect(story.positivity_score).to eq 0
    end

    it 'calculates a positivity of 3 given 6 positive words and 3 negative words' do
      story = Story.new(
        id: 12,
        headline: 'Some headline',
        body: 'positive, success, grow, gains, happy, healthy,
              dissapointing, concerns, decline')

      expect(story.positivity_score).to eq 3
    end

    it 'calculates a positivity of -3 given 3 positive words and 6 negative words' do
      story = Story.new(
        id: 12,
        headline: 'Some headline',
        body: 'positive, success, grow,
              dissapointing, concerns, decline, drag, slump, feared')

      expect(story.positivity_score).to eq -3
    end
  end

  context 'sentiment analysis' do
    it 'returns a positive sentiment analysis given a score of 2' do
      allow(story).to receive(:positivity_score).and_return(2)
      expect(story.sentiment_analysis).to eq :neutral
    end
  end
end