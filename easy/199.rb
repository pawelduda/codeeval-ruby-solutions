# https://www.codeeval.com/browse/199/

def mask_word(word, mask)
  word.chars.zip(mask.chars).map do |char_and_mask|
    char_and_mask[1] == '1' ? char_and_mask[0].upcase : char_and_mask[0].downcase
  end.join
end

def parse_input(input)
  input = input.split(' ')
  {
    word: input[0],
    mask: input[1]
  }
end

# File.open(ARGV[0]).each_line do |word_and_mask|
#   args = parse_input(word_and_mask)
#   puts mask_word(args[:word], args[:mask])
# end

# tests
p mask_word('hello', '11001') == 'HEllO'
p mask_word('world', '10000') == 'World'
p mask_word('cba', '111') == 'CBA'
args = parse_input('qngagtfhmqw 01100101111')
puts mask_word(args[:word], args[:mask])
