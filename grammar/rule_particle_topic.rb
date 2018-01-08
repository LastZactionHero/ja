class ParticleTopic < Rule

  def word_filter
    [
      { part_of_speech: :noun }
    ]
  end

  def word_count
    2
  end

  def apply(word_a, word_b)
    english = "Topic of #{word_a.english}, #{word_b.english}."
    japanese = "#{word_a.japanese}は#{word_b.japanese}。"

    OpenStruct.new(english: english, japanese: japanese)
  end
end
