# https://www.codeeval.com/browse/18/

def split_args(str)
  str.split(',').map(&:to_i) 
end

def lowest_multiple_greatest_than(x, n)
  result = 0
  mult = 1

  loop do
    result = n * mult
    mult += 1 
    break if result >= x
  end

  result
end

File.new(ARGV[0]).each_line do |line|
  x, n = split_args(line)
  puts lowest_multiple_greatest_than(x, n)
end

# tests
=begin
p split_args('13,8') == [13, 8]
p lowest_multiple_greatest_than(13, 8) == 16
p lowest_multiple_greatest_than(17, 16) == 32
=end