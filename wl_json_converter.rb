# Convert CSV word lists to more comprehensive JSON
require 'csv'
require 'json'

csv_filename = ARGV[0]
json_filename = ARGV[1]

if csv_filename.empty? || json_filename.empty?
  puts "Usage: ruby wl_json_converter.rb <input_filename> <output_filename>"
  exit
end

lines = CSV.readlines(csv_filename)

words = []

lines.each do |line|
  phonetic = nil
  kanji = nil
  english = nil

  if line.length == 2
    phonetic = line[0]
    english = line[1]
  elsif line.length == 3
    phonetic = line[0]
    kanji = line[1]
    english = line[2]
  else
    puts "Skipping: #{line.join(',')}"
  end

  words << {
    english: english,
    phonetic: phonetic,
    kanji: kanji,
    part_of_speech: nil,
    subclass: nil,
    conjugations: []
  }
end

json = JSON.pretty_generate(words)

file = File.open(json_filename, 'w')
file << json
file.close

puts "Converted #{words.length} words"
puts "Wrote to #{json_filename}"
