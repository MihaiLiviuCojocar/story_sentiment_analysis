describe String do
  context 'calculating a sentiment score' do
    it 'returns a score of 1 given a word that is marked as positive' do
      positive_words = String::POSITIVE_WORDS
      positive_words.each do |positive_word|
        expect(positive_word.sentiment_score).to eq 1
      end
    end

    it 'returns a score of -1 given a word that is marked as negative' do
      negative_words = String::NEGATIVE_WORDS
      negative_words.each do |negative_word|
        expect(negative_word.sentiment_score).to eq -1
      end
    end

    it 'returns a score of 0 given a word that is not marked as positive or negative' do
      unmarked_words = ['some', 'unmarked', 'words']
      unmarked_words.each do |unmarked_word|
        expect(unmarked_word.sentiment_score).to eq 0
      end
    end
  end
end