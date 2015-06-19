# https://www.codeeval.com/browse/12/

def first_non_repeated_character(word)
  word.chars.each { |char| return char if word.chars.count(char) == 1 }
end

File.open(ARGV[0]).each_line do |word|
  puts first_non_repeated_character(word)
end

# tests
# p first_non_repeated_character('yellow') == 'y'
# p first_non_repeated_character('tooth') == 'h'
