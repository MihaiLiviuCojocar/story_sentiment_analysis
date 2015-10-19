class Story
  attr_reader :id, :headline, :body

  POSITIVE_WORDS = ['positive', 'success', 'grow', 'gains', 'happy', 'healthy'       ]
  NEGATIVE_WORDS = ['dissapointing', 'concerns', 'decline', 'drag', 'slump', 'feared']

  def initialize(args = {})
    @id       = args[:id]
    @headline = args[:headline]
    @body     = args[:body]
  end

  def positivity_score
    words.reduce(0) { |memo, word| memo + score_for_word(word) }
  end

  private

  def words
    body.split(/\W+/).map { |word| word.downcase }
  end

  def score_for_word(word)
    return 1  if POSITIVE_WORDS.include?(word)
    return -1 if NEGATIVE_WORDS.include?(word)
    return 0
  end
end