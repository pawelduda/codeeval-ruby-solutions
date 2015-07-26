# https://www.codeeval.com/browse/17/

def parse_input(input)
  input.split(',').map(&:to_i)
end

def largest_sum(numbers)
  max = 0
  
  sums = []
  (1..numbers.length).each do |i|
    # sums << numbers.combination(i).reduce(:+)
    sums << numbers.combination(2).to_a.map { |subarray| subarray.reduce(:+) }
  end
  # sums.max 
  sums.flatten.max
end

# tests
p largest_sum(parse_input('-10,2,3,-2,0,5,-15')) #== 8
p largest_sum(parse_input('2,3,-2,-1,10')) #== 12
