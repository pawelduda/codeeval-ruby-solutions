# https://www.codeeval.com/browse/104/

def word_to_num(word)
  ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'].index(word)      
end

File.open(ARGV[0]).each_line do |line|
  line.strip.split(';').each { |word| print word_to_num(word) }
  puts ''
end

# tests
=begin
p word_to_num('zero') == 0
p word_to_num('nine') == 9
=end