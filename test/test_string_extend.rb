require 'test/unit'
require './../string_extend'

class TestStringExtend < Test::Unit::TestCase
  def test_sentences
    assert_equal(['i', "i a'm", 'v', 'e f g'], "i. i a'm. v. e f g.".sentences)

    test_text = %(Hello, this is a testing returns.
    It also tests newlines.)
    assert_equal('It also tests newlines', test_text.sentences[1])
  end

  def test_words
    assert_equal(%w[hello hi whats-up], 'hello hi whats-up'.words)
    assert_equal(%w[these are mostly words], 'these, are, ,mostly words.'.words)
  end
end
