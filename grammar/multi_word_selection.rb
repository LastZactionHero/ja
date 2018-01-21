module MultiWordSelection
  def select_word(word_list)
    word_filter.map do |filter|
      filtered_word_list = word_list.filter_by_rule(filter)
      filtered_word_list.words.sample
    end
  end
end