class Word
  attr_accessor :hiragana, :kanji, :english, :raw, :part_of_speech, :subclass

  def initialize(raw)
    @hiragana = raw['phonetic']
    @kanji = raw['kanji']
    @english = raw['english']
    @part_of_speech = raw['part_of_speech'] ? raw['part_of_speech'].to_sym : nil
    @subclass = raw['subclass'] ? raw['subclass'].gsub('-', '_').to_sym : nil
    @raw = raw
  end

  def japanese
    @kanji ? @kanji : @hiragana
  end

  def to_s
    puts @hiragana.to_s
    puts @kanji.to_s
    puts @english.to_s
    puts "#{@part_of_speech} - #{@subclass}"
  end
end

