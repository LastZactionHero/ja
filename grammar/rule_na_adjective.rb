require './grammar/multi_word_selection'

class NaAdjective < Rule
  include MultiWordSelection

  def word_filter
    [
      [
        { part_of_speech: :adjective, subclass: :na_adjective } 
      ],
      [
        { part_of_speech: :noun }
      ]
    ]
  end

  def sentence_pair(word_list)
    words = select_word(word_list)

    english = "#{words[0].english} #{words[1].english}"
    japanese = "#{words[0].japanese}な#{words[1].japanese}"

    OpenStruct.new(english: english, japanese: japanese)
  end
end
