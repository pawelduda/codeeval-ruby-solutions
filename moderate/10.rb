# https://www.codeeval.com/browse/10/

def parse_input(input)
  input = input.split(' ')
  {
    list: input[0..-2],
    n: input[-1].to_i
  }
end

def nth_to_last_element(list, n)
  list[-n]
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line)
  puts nth_to_last_element(input[:list], input[:n]) unless input[:list].length < input[:n]
end

# tests
# p parse_input('a b c d 4') == { list: %w[a b c d], n: 4 }
# p nth_to_last_element(%w[a b c d], 4) == 'a'
# p nth_to_last_element(%w[e f g h], 2) == 'g'
