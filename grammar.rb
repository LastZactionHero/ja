require 'optparse'
require './word_list'
require './grammar/rule'
require './grammar/rule_da_declaration'
require './grammar/rule_da_past_declaration'
require './grammar/rule_da_negative_declaration'
require './grammar/rule_da_past_negative_declaration'
require './grammar/rule_particle_topic'

direction = nil

OptionParser.new do |opts|
  opts.banner = "Usage: .rb [options]"

  opts.on('-d', '--direction DIRECTION', [:en_to_ja, :ja_to_en], 'Direction (en_to_ja, ja_to_en)') do |a|
    direction = a
  end

  opts.on('-h', '--help', 'Help') do
    puts opts
    exit
  end
end.parse!

puts "Japanese Grammar Testing"

# Generate Japanese sentences, ask for English translations.
# Generate English sentences, ask for Japanese translations.

# Load the word list
filename = './word_lists_json/all_time.json'
word_list = WordList.load_from_file(filename)

while true
  # Select a rule
  rules = [
    #DaDeclaration,
    DaPastDeclaration,
    DaNegativeDeclaration,
    DaPastNegativeDeclaration,
    #ParticleTopic
  ]
  rule = rules.sample.new

  # Filter the word list to those allowed by the rule
  filtered_word_list = word_list.filter_by_rule(rule.word_filter)
  words = filtered_word_list.words.sample(rule.word_count)

  # Generate an English sentence using the rule
  # Generate a Japanese sentence using the rule
  sentence_pair = rule.apply(*words)

  # Request Japanese translation
  question = direction == :en_to_ja ? sentence_pair.english : sentence_pair.japanese
  expected = direction == :en_to_ja ? sentence_pair.japanese : sentence_pair.english

  puts question
  answer = $stdin.gets.strip

  exit if answer == 'quit'

  if answer == expected
    puts "Correct!"
  else
    puts "Incorrect!"
    puts expected
  end
  puts ""

  gets.strip
  puts "\e[H\e[2J"
end
