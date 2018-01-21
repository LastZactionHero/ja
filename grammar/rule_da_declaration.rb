require './grammar/single_word_selection'

class DaDeclaration < Rule
  include SingleWordSelection

  # Attached to noun or na-adjective to make a declarative statement.
  # Not necessary, makes sentence more declarative or masculine.

  def word_filter
    [
      { part_of_speech: :noun },
      { part_of_speech: :adjective, subclass: :na_adjective }
    ]
  end

  def sentence_pair(word_list)
    word = select_word(word_list)

    english = "Is #{word.english}."
    japanese = "#{word.japanese}だ。"

    OpenStruct.new(english: english, japanese: japanese)
  end
end
