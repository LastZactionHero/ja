require './grammar/single_word_selection'

class DaPastDeclaration < Rule
  include SingleWordSelection

  def word_filter
    [
      { part_of_speech: :noun },
      { part_of_speech: :adjective, subclass: :na_adjective }
    ]
  end

  def sentence_pair(word_list)
    english = "Was #{word.english}."
    japanese = "#{word.japanese}だった。"

    OpenStruct.new(english: english, japanese: japanese)
  end
end
