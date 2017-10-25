require 'pry'

WORD_LIST_FILENAME = './word_list_1000.txt'.freeze
VOICE_NAME_EN = 'Victoria'.freeze
VOICE_NAME_JA = 'Kyoko'.freeze
WORD_REPEATS = 2

word_list = File.readlines(WORD_LIST_FILENAME)

splitter = word_list.first.gsub(/\s/, ' ').split(' ')[1]
js_splitter = word_list.first[4]

word_pairs = word_list.map do |word_line|
  begin
    word_js, word_en = word_line.split(splitter)

    word_en = word_en.partition('(').first.strip
    word_js = word_js.partition(js_splitter).first

    { ja: word_js, en: word_en }
  rescue NoMethodError
    nil
  end
end.compact

played = []

word_pair = word_pairs.unshift

Kernel.loop do
  word_pair = if rand >= 0.5 || played.empty?
                # Pick a new word
                wp = word_pairs.sample
                word_pairs.delete(wp)
                played << wp
                wp
              else
                # Pick a word to review
                played.sample
              end

  puts "#{word_pair[:ja]} - #{word_pair[:en]}"

  WORD_REPEATS.times do
    `say -v #{VOICE_NAME_JA} --quality=127 #{word_pair[:ja]}`
    sleep(1)
    `say -v #{VOICE_NAME_EN} --quality=127 #{word_pair[:en]}`
    sleep(2)
  end
end
