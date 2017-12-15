require 'optparse'
require 'json'
require 'pry'
require './trial'

# word_list_name = ARGV[0]
# activity = ARGV[1].to_sym # learning, testing

word_list_name = nil
activity = nil

OptionParser.new do |opts|
  opts.banner = "Usage: .rb [options]"

  opts.on('-a', '--activity ACTIVITY', [:learning, :testing], 'Activity (learning, testing)') do |a|
    activity = a
    exit if activity.nil?
  end

  opts.on('-w', '--wordlist WORDLIST', 'Word list file name') do |a|
    word_list_name = a
    exit if word_list_name.nil?
  end
end.parse!

@filename = "./word_lists_json/#{word_list_name}.json"

include Trial

class Word
  attr_accessor :hiragana, :kanji, :english
  def initialize(h, k, e)
    @hiragana = h
    @kanji = k
    @english = e
  end
end

def init_test
  content = File.read(@filename)
  json = JSON.parse(content)

  @words = json.map do |json_word|
    Word.new(
      json_word['phonetic'],
      json_word['kanji'],
      json_word['english']
    )
  end

  @trials = []
  @no_mistakes = true
end

@incorrect = []

init_test
start_test(:en_ja_translation, activity)

init_test
start_test(:ja_en_translation, activity)

if activity == :testing && @incorrect.any?
  incorrect_list = @incorrect.uniq{|i| i.english}
  puts "Writing #{incorrect_list.length} words to relearn list"
  CSV.open('./word_lists/relearn.csv', 'w') do |csv|
    incorrect_list.each do |incorrect_word|
      word_arr = [incorrect_word.hiragana]
      word_arr << incorrect_word.kanji if incorrect_word.kanji && incorrect_word.kanji.length > 0
      word_arr << incorrect_word.english
      csv << word_arr
    end
  end
end
