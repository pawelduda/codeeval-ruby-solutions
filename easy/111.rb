def get_longest_word(sentence)
  longest_word_chars = 0
  longest_word_index = nil
  sentence = sentence.split(' ').each_with_index do |word, index|
    if longest_word_chars < word.size
      longest_word_chars = word.size
      longest_word_index = index
    end
  end

  sentence[longest_word_index]
end

p get_longest_word('some line with text') == 'some'
p get_longest_word('another line') == 'another'