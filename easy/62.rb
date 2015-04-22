# https://www.codeeval.com/browse/62/

def split_args(str)
  str.split(',').map(&:to_i)
end

def modulus(n, m)
  return n if m > n

  while n >= m do
    n -= m
  end

  n 
end

File.open(ARGV[0]).each_line do |line|
  n, m = split_args(line)
  puts modulus(n, m)
end

# tests
=begin
p split_args('20,6') == [20, 6]
p modulus(20, 6) == 2
p modulus(2, 3) == 2
p modulus(3, 3) == 0
p modulus(18, 65) == 18
=end