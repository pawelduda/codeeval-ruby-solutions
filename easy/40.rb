# https://www.codeeval.com/browse/40/

def is_self_describing_number?(num)
  digits_ary = num.to_s.split('').map(&:to_i)

  digits_ary.each_with_index do |x, index|
    return 0 if digits_ary.count(index) != x
  end

  1
end

File.open(ARGV[0]).each_line do |line|
  puts is_self_describing_number?(line.to_i)
end

# tests
=begin
p is_self_describing_number?(2020) == 1
p is_self_describing_number?(22) == 0
p is_self_describing_number?(1210) == 1
p is_self_describing_number?(748606) == 0
=end