# https://www.codeeval.com/browse/34/

def parse_input(input)
  input = input.split(';')
  {
    numbers: input[0].split(',').map(&:to_i),
    number: input[1].to_i
  }
end

class Array
  def pairs_whose_sum_is_equal_to(number)
    pairs = self.permutation(2).select { |pair| pair.reduce(:+) == number }
    pairs.size > 0 ? pairs[0..pairs.size / 2 - 1].map { |pair| pair.join(',') }.join(';') : 'NULL'
  end
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line)
  puts input[:numbers].pairs_whose_sum_is_equal_to(input[:number])
end

# tests
# p [1, 2, 3, 4, 6].pairs_whose_sum_is_equal_to(5) == '1,4;2,3'
# input = parse_input('2,4,5,6,9,11,15;20')
# p input[:numbers].pairs_whose_sum_is_equal_to(20) == '5,15;9,11'
# input = parse_input('1,2,3,4;50')
# p input[:numbers].pairs_whose_sum_is_equal_to(50) == 'NULL'


