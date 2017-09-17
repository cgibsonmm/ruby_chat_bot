require 'test/unit'
require_relative 'test_string_extend'
require './../wordplay'

class TestWordPlay < Test::Unit::TestCase
  def test_sentence_choice
    assert_equal('This is a great test',
                 WordPlay.best_sentence(['This is a test',
                                         'This is another test',
                                         'This is a great test'],
                                        %w[test great this]))
  end

  def test_basic_pronouns
    assert_equal('i am a robot', WordPlay.switch_pronouns('you are a robot'))
    assert_equal('you are a person', WordPlay.switch_pronouns('I am a person'))
    assert_equal('i love you', WordPlay.switch_pronouns('You love me'))
  end

  def test_mixed_pronouns
    assert_equal('you gave me life', WordPlay.switch_pronouns('I gave you life'))
    assert_equal('i am not what you are',
                 WordPlay.switch_pronouns('you are not what i am'))
    assert_equal('i annoy your dog', WordPlay.switch_pronouns('you annoy my dog'))
  end
end
