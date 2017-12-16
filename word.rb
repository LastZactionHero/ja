class Word
  attr_accessor :hiragana, :kanji, :english, :raw

  def initialize(raw)
    @hiragana = raw['phonetic']
    @kanji = raw['kanji']
    @english = raw['english']
    @raw = raw
  end

  def to_s
    puts @hiragana.to_s
    puts @kanji.to_s
    puts @english.to_s
  end
end

