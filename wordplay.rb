require_relative 'string_extend'

class WordPlay
  def self.best_sentence(sentences, desired_word)
    ranked_senteces = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - desired_word).length
    end

    ranked_senteces.last
  end

  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Me|Your|My|Computer)\b/i) do |pronoun|
      case pronoun.downcase
      when 'i'
        'you'
      when 'you'
        'me'
      when 'me'
        'you'
      when 'i am'
        'you are'
      when 'you are'
        'i am'
      when 'your'
        'my'
      when 'my'
        'your'
      when 'computer'
        'Corey'
      end
    end.sub(/^me\b/i, 'i')
  end
end
