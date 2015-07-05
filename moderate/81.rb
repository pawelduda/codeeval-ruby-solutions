# https://www.codeeval.com/browse/81/

def parse_input(input)
  input.split(',').map(&:to_i)
end

def number_of_ways_to_sum_to_zero(numbers)
  number_of_ways = 0
  
  numbers.combination(4).each { |four_numbers| number_of_ways += 1 if four_numbers.reduce(:+) == 0 }
  
  number_of_ways
end

File.open(ARGV[0]).each_line do |line|
  puts number_of_ways_to_sum_to_zero(parse_input(line))
end

# tests
# p number_of_ways_to_sum_to_zero(parse_input('2,3,1,0,-4,-1')) == 2
# p number_of_ways_to_sum_to_zero(parse_input('0,-1,3,-2')) == 1
