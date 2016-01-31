require 'test_helper'
require 'string_segmenter'

class StringSegmenterTest < Minitest::Test
  def test_simple
    sample_input = "speakthiswordordie"
    assert_equal(["speak", "this", "word", "or", "die"], segment_string(sample_input))
  end

  def test_plural
    sample_input = "capcapecapscapes"
    assert_equal(["cap", "cape", "caps", "capes"], segment_string(sample_input))
  end

  def test_prefix
    sample_input = "apartapartmentpart"
    assert_equal(["apart", "apartment","part"], segment_string(sample_input))
  end

  def test_suffix
    sample_input = "partingpartedcapcappingcaptioncaptioning"
    assert_equal(["parting", "parted", "cap", "capping", "caption", "captioning"], segment_string(sample_input))
  end

  def test_word_in_word
    sample_input = "speakersatsthisword"
    assert_equal(["speak", "ersats", "this", "word"], segment_string(sample_input))
  end

  def test_blank_str
    sample_input = ""
    assert_equal([], segment_string(sample_input))
  end
end

# Remember, the names of all test methods should begin with "test_".

# Possible scenarios:
# plural
# -ing, -tion, -er, -en, -est, -ly, -ize, -ish, -ist, etc.
# complete word within another word

# Given an array of words, with or without spacing, find and pick out only the real words
# 