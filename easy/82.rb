# https://www.codeeval.com/browse/82/

def is_armstrong_number?(num_str)
  sum = num_str.split('').map(&:to_i).inject(0) { |sum, n| sum += n ** num_str.length }
  sum == num_str.to_i ? 'True' : 'False'
end

File.open(ARGV[0]).each_line do |line|
  puts is_armstrong_number?(line.strip)
end

# tests
=begin
p is_armstrong_number?('6') == 'True'
p is_armstrong_number?('153') == 'True'
p is_armstrong_number?('351') == 'False'
=end