require 'json'
require './word'

class WordList
  attr_reader :words

  def self.load_from_file(filename)
    content = File.read(filename)
    json = JSON.parse(content)
    words = json.map { |json_word| Word.new(json_word) }

    new(words)
  end

  def initialize(words)
    @words = words
  end

  def filter_by_rule(filters)
    filtered_words = filters.flat_map do |filter|
      @words.select do |word|
        word.part_of_speech == filter[:part_of_speech] &&
        ( filter[:subclass].nil? ||
          filter[:subclass] == word.subclass )
      end
    end
    WordList.new(filtered_words)
  end
end
