# https://www.codeeval.com/browse/113/

File.open(ARGV[0]).each_line do |line|
  ary = line.split(' | ').map { |ary| ary.split(' ').map(&:to_i) }
  ary = ary[0].zip(ary[1]).map { |x, y| x * y }
  puts ary.join(' ')
end

# tests
=begin
ary = '9 0 6 | 15 14 9'.split(' | ').map { |ary| ary.split(' ').map(&:to_i) }
ary = ary[0].zip(ary[1]).map { |x, y| x * y }
p ary.join(' ') == '135 0 54'
=end