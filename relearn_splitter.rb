require 'json'

filename = './word_lists_json/relearn.json'
contents = JSON.parse(File.read(filename))

puts "#{contents.length} words"

puts 'How many files?'
split_count = gets.strip.to_i

raise ArgumentError if split_count <= 0 || split_count > contents.length

words_per_file = contents.length / split_count

split_count.times do |i|
  last_file = contents.length < words_per_file * 2
  split_words = last_file ? contents : contents.shift(words_per_file)
  puts "File #{i + 1}: #{split_words.count} words"

  file = File.open("./word_lists_json/relearn_#{i + 1}.json", 'w')
  file << JSON.pretty_generate(split_words)
  file.close
end
