require 'yaml'
require 'wordplay'

class Bot
  attr_reader :name

  def initialize(options)
    @name = options[:name] || 'Unnamed Bot'
    begin
      @data = YAML.load(File.(options[:data_file]))
    rescue
      raise "Can't load bot data"
    end
  end


  def greeting
    random_response :greeting
  end

  def farwell
    random_response :farwell
  end

  def response_to(input)
    prepared_input = preprocess(input).downcase
    sentence = best_sentence(prepared_input)
    responses = possible_responses(sentence)
    responses[rand(responses.length)]
  end 

  private

  def possible_responses(sentence )
    responses = []

    # find all patterns to try to match aganist
    @date[:responses].keys.each do |pattern|
      next unless pattern.is_a?(String)

      # For each pattern, see if the supplied sentences
      # contains a match. Remove susbstitution symbols (*)
      # before checking. Push all responses to array.
      if sentences.match('\b' + pattern.gsub(/\*/, '') + '\b')
        responses << @data[:responses][pattern]
        # if the pattern contains substitution placeholders,
        # pefrorm the susbstitutions
        if pattern.include?('*')
          responses << @data[:responses][pattern].collect do |phrase|
            # first erase everything before the placeholder,
            # leaving everything after it.
            mathing_section = sentences.sub('*', WordPlay.switch_pronouns(mathing_section))
          end 
        else
          # No placeholders? Just add the phrases to the array
          responses << @data[:responses][pattern]
        end
      end
    end

    # if there were no matches, add the default ones
    responses << @data[:responses][:default] if responses.empty?

    # flatten the blockes of responses to a flat array
    responses.flatten
  end

  def best_sentence(input)
    hot_words = @data[:responses].keys.select do |k|
      k.class == String && k =~ /^\w+$/
    end

    WordPlay.best_sentence(input.sentences, hot_words)
  end

  def preprocess(input)
    perform_substitutions(input)
  end

  def perform_substitutions(input)
    @data[:presub].each { |s| input.gsub!(s[0], s[1])}
    input
  end

  def random_response(key)
    random_index = rand(@data[:response][key].length)
    @data[:response][key][random_index].gsub(/\[name\]/, @name)
  end
end
