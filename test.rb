require 'optparse'
require 'json'
require 'pry'
require './exam'
require './word'

word_list_name = nil
activity = nil
max_words = nil

OptionParser.new do |opts|
  opts.banner = "Usage: .rb [options]"

  opts.on('-a', '--activity ACTIVITY', [:learning, :testing], 'Activity (learning, testing)') do |a|
    activity = a
  end

  opts.on('-w', '--wordlist WORDLIST', 'Word list file name') do |a|
    word_list_name = a
  end

  opts.on('-m', '--maxwords MAXWORDS', 'Maximum number of words to test') do |a|
    max_words = a.to_i
  end

  opts.on('-h', '--help', 'Help') do
    puts opts
    exit
  end
end.parse!

@filename = "./word_lists_json/#{word_list_name}.json"

def read_word_list
  content = File.read(@filename)
  json = JSON.parse(content)
  json.map { |json_word| Word.new(json_word) }
end

@incorrect = []

word_list = read_word_list
word_list = word_list.sample(max_words) if max_words

[:en_ja_translation, :ja_en_translation].each do |exam_direction|
  exam = Exam.new(exam_direction, activity, word_list)
  exam_incorrect = exam.run
  @incorrect.concat(exam_incorrect)
end

@incorrect.uniq!(&:raw)

if activity == :testing && @incorrect.any?
  puts "Writing #{@incorrect.length} words to relearn list"

  file = File.open('./word_lists_json/relearn.json', 'w')
  file << JSON.pretty_generate(@incorrect.map(&:raw))
  file.close
end
