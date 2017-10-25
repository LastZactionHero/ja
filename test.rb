require 'csv'
require 'pry'
require './trial'

word_pack_name = ARGV[0]
filename = "./word_lists/#{word_pack_name}.csv"
WORD_COUNT = 1000

include Trial

class Word
  attr_accessor :hiragana, :kanji, :english
  def initialize(h, k, e)
    @hiragana = h
    @kanji = k
    @english = e
  end
end

lines = CSV.read(filename, "r")
lines = lines.first(WORD_COUNT)

@words = []

# Parse words with Hiragana, Kanji, and English
lines.select { |l| l.length == 3 }.each do |line|
  @words.push(
    Word.new(line[0], line[1], line[2])
  )
end
# Parse words with Hiragana and English
lines.select { |l| l.length == 2 }.each do |line|
  @words.push(
    Word.new(line[0], nil, line[1])
  )
end

@trials = []
@no_mistakes = true

start_test(:hiragana_translation)