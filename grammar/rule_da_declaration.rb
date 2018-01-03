class DaDeclaration
  # Attached to noun or na-adjective to make a declarative statement.
  # Not necessary, makes sentence more declarative or masculine.

  def word_filter
    [
      { part_of_speech: :noun },
      { part_of_speech: :adjective, subclass: :na_adjective }
    ]
  end

  def apply(word)
    english = "Is #{word.english}."
    japanese = "#{word.japanese}だ。"

    OpenStruct.new(english: english, japanese: japanese)
  end
end
