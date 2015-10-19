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

  context 'sentiment analysis' do
    let(:story) { Story.new(
      id: 12,
      headline: 'Some headline',
      body: 'positive, success, grow, gains, happy, healthy,
            dissaponting, concerns, decline, drag, slump, feared'
      )}

    it 'can count positive words' do
      expect(story.positive_words_count).to eq 6
    end
  end
end