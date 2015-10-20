class Story
  attr_reader :id, :headline, :body

  POSITIVE_RANGE = Range.new(2,Float::INFINITY)
  NEGATIVE_RANGE = Range.new(-Float::INFINITY,-1)
  NEUTRAL_RANGE  = Range.new(0,1)

  SENTIMENTS = {
    POSITIVE_RANGE => :positive,
    NEGATIVE_RANGE => :negative,
    NEUTRAL_RANGE  => :neutral
  }

  SENTIMENT_FACES = {
    positive: '&#128516;',
    negative: '&#128550;',
    neutral:  '&#128528;'
  }

  def initialize(args = {})
    @id       = args[:id]
    @headline = args[:headline]
    @body     = args[:body]
  end

  def sentiment_analysis
    SENTIMENTS.find { |range, sentiment| range.include?(positivity_score) }.last
  end

  def sentiment_face_unicode
    SENTIMENT_FACES[sentiment_analysis]
  end

  private
  
  def positivity_score
    normalised_words.reduce(0) { |memo, word| memo + word.sentiment_score }
  end

  def normalised_words
    body.split(/\W+/).map(&:downcase)
  end
end