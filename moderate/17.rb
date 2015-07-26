# https://www.codeeval.com/browse/17/

def parse_input(input)
  input.split(',').map(&:to_i)
end

def largest_sum(numbers)
  sums = []
  (0..numbers.length).each do |index|
    (1..numbers.length - index).each do |length|
      sums << numbers[index, length].reduce(:+)
    end
  end
  sums.max
end

File.open(ARGV[0]).each_line { |line| puts largest_sum(parse_input(line)) }

# tests
# p largest_sum(parse_input('-10,2,3,-2,0,5,-15')) == 8
# p largest_sum(parse_input('2,3,-2,-1,10')) == 12
