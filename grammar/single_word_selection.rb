module SingleWordSelection
  def select_word(word_list)
    filtered_word_list = word_list.filter_by_rule(word_filter)
    filtered_word_list.words.sample
  end
end