require 'json'

words = JSON.parse(
  File.read('./word_lists_json/all_time.json')
)


words.each_with_index do |word, word_idx|
  puts "#{word_idx}/#{words.length}"

  puts "#{word['english']} - #{word['kanji']} - #{word['phonetic']}"

  puts "1) Noun; 2) Adjective; 3) Verb"
  pos_number = gets.strip
  puts pos_number

  pos_options = {1 => 'noun', 2 => 'adjective', 3 => 'verb'}
  pos = pos_options[pos_number.to_i]
  word['part_of_speech'] = pos

  file = File.open('./word_lists_json/all_time_pos.json', 'w')
  file << JSON.pretty_generate(words)
  file
end
