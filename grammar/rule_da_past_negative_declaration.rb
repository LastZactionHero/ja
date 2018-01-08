class DaPastNegativeDeclaration < Rule

  def word_filter
    [
      { part_of_speech: :noun },
      { part_of_speech: :adjective, subclass: :na_adjective }
    ]
  end

  def apply(word)
    english = "Was not #{word.english}."
    japanese = "#{word.japanese}じゃなかった。"

    OpenStruct.new(english: english, japanese: japanese)
  end
end
