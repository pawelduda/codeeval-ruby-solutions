# https://www.codeeval.com/browse/19/

def split_args(str)
  str.split(',').map(&:to_i)
end

def bits_eql?(num, p1, p2)
  binary_str = num.to_s(2).reverse
  binary_str[p1 - 1] == binary_str[p2 - 1] ? 'true' : 'false' 
end

File.new(ARGV[0]).each_line do |line|
  num, p1, p2 = split_args(line)
  puts bits_eql?(num, p1, p2)
end

# tests
=begin
p split_args('86,2,3') == [86, 2, 3]
p bits_eql?(86, 2, 3) == 'true'
p bits_eql?(125, 1, 2) == 'false'
=end
