class DaNegativeDeclaration
  def word_filter
    [
      { part_of_speech: :noun },
      { part_of_speech: :adjective, subclass: :na_adjective }
    ]
  end

  def apply(word)
    english = "Not #{word.english}."
    japanese = "#{word.japanese}じゃない。"

    OpenStruct.new(english: english, japanese: japanese)
  end
end
