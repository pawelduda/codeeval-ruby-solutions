# https://www.codeeval.com/browse/43/

def parse_input(input)
  input.split(' ')[1..-1].map(&:to_i)
end

def jolly_jumper?(sequence)
  differences = []
  (0..sequence.length - 2).each { |i| differences << (sequence[i] - sequence[i + 1]).abs }
  (1..sequence.length - 1).to_a == differences.sort ? 'Jolly' : 'Not jolly'
end

File.open(ARGV[0]).each_line do |line|
  puts jolly_jumper?(parse_input(line.strip))
end

# tests
# p parse_input('4 1 4 2 3') == [1, 4, 2, 3]
# p jolly_jumper?([1, 4, 2, 3]) == 'Jolly'
# p jolly_jumper?([7, 7, 8]) == 'Not jolly'
# p jolly_jumper?([8, 9, 7, 10, 6, 12, 17, 24, 38]) == 'Not jolly' 
