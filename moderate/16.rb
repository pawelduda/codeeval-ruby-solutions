# https://www.codeeval.com/browse/16/

def count_one_bits(decimal)
  decimal.to_s(2).split('').count('1')
end

File.open(ARGV[0]).each_line do |line|
  puts count_one_bits(line.to_i)
end

# tests
# p count_one_bits(10) == 2
# p count_one_bits(22) == 3
# p count_one_bits(56) == 3
