# https://www.codeeval.com/browse/91/

def num_str_to_ary(str)
  str.split(' ').map(&:to_f)
end

File.open(ARGV[0]).each_line do |line|
  arr = num_str_to_ary(line).sort.map do |x|
    '%.3f' % x
  end.join(' ')
  puts arr
end

# tests
=begin
p num_str_to_ary('70.920 -38.797 14.354 99.323 90.374 7.581') == [70.920, -38.797, 14.354, 99.323, 90.374, 7.581]

arr = [70.920, -38.797, 14.354, 99.323, 90.374, 7.581].sort.map do |x|
  '%.3f' % x
end.join(' ')
p arr == '-38.797 7.581 14.354 70.920 90.374 99.323'
=end