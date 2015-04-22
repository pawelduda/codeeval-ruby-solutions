# https://www.codeeval.com/browse/39/

def get_sum_of_squares(num)
  num.to_s.split('').map(&:to_i).reduce(0) { |sum, n| sum + n**2 }
end

def is_happy_number?(num)
  seq = []

  loop do
    num = get_sum_of_squares(num)
    seq << num
    return 0 if seq.count(num) == 2
    return 1 if num == 1
  end
end

File.open(ARGV[0]).each_line do |line|
  puts is_happy_number?(line)
end

# tests
=begin
p get_sum_of_squares(123) == 14 
p get_sum_of_squares(6) == 36 
p get_sum_of_squares(49) == 97
p is_happy_number?(1) == 1
p is_happy_number?(7) == 1
p is_happy_number?(22) == 0
=end