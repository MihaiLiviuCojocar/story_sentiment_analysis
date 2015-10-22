class String
  POSITIVE_WORDS = ['positive', 'success', 'grow', 'gains', 'happy', 'healthy'       ]
  NEGATIVE_WORDS = ['dissapointing', 'concerns', 'decline', 'drag', 'slump', 'feared']

  SCORES = {
    POSITIVE_WORDS =>  1,
    NEGATIVE_WORDS => -1
  }

  def sentiment_score
    return score if relevant_for_analysis?
    return 0
  end

  private

  def relevant_for_analysis?
    SCORES.keys.flatten.include?(self.downcase)
  end

  def score
    SCORES.find { |words, score| words.include?(self.downcase) }.last
  end
end
