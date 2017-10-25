require 'csv'
require 'pry'

SENTENCE_FILE_EN = './sentences_en.txt'
SENTENCE_FILE_JA = './sentences_ja.txt'
VOICE_NAME_EN = 'Victoria'.freeze
VOICE_NAME_JA = 'Kyoko'.freeze

REPEAT_COUNT = 1

lines_en = CSV.readlines(SENTENCE_FILE_EN)
lines_ja = CSV.readlines(SENTENCE_FILE_JA)

raise ArgumentError if lines_en.length != lines_ja.length

lines_en.each_with_index do |line_en, idx|
  line_ja = lines_ja[idx]

  REPEAT_COUNT.times do 
    # `say -v #{VOICE_NAME_EN} --quality=127 #{line_en}`
    # sleep(1)
    `say -v #{VOICE_NAME_JA} --quality=127 #{line_ja}`
    sleep(0.5)
  end
end