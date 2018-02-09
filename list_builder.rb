require 'json'

puts "Word List Name"
word_list_name = gets.strip

words = []

while true
  puts "English, 'exitnow' to quit"
  english = gets.strip
  break if english == 'exitnow'

  puts "Kanji"
  kanji = gets.strip

  puts "Phonetic"
  phonetic = gets.strip

  # puts "Part of Speech"
  # pos = gets.strip

  # puts "Subclass"
  # subclass = gets.strip

  word = {
    "english" => english,
    "phonetic" => phonetic,
    "kanji" => kanji,
    "part_of_speech" => '',
    "subclass" => '',
    "conjucations"=> []
  }
  words << word
end

file = File.open("./word_lists_json/#{word_list_name}.json", 'w')
file << JSON.pretty_generate(words)
file.close

