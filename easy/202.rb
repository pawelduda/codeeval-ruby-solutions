# https://www.codeeval.com/browse/202/

def longest_or_first_word(words)
  words.split(' ').reverse.sort_by(&:length).last
end

def stepwise_word(word)
  chars = word.chars.to_a
  (0..word.length - 1).inject([]) { |step_word, i| step_word << '*' * i + chars[i] }.join(' ')
end

File.open(ARGV[0]).each_line do |line|
  puts stepwise_word(longest_or_first_word(line))
end

# tests
# p longest_or_first_word('cat dog rat') == 'cat'
# p longest_or_first_word('cat dog hello') == 'hello'
# p longest_or_first_word('stop football play') == 'football'
# p stepwise_word('hello') == 'h *e **l ***l ****o'
# p stepwise_word('football') == 'f *o **o ***t ****b *****a ******l *******l'
