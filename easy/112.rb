# https://www.codeeval.com/browse/112/
def parse_line(line)
  line = line.split(' : ')
  ary = line[0].split(' ').map(&:to_i)
  swaps = line[1].split(', ').map do |swap_str|
    swap_str.split('-').map(&:to_i)
  end

  [ary, swaps]
end

def do_swaps(ary, swaps)
  swaps.each do |swap|
    ary[swap[0]], ary[swap[1]] = ary[swap[1]], ary[swap[0]]
  end

  ary
end

File.open(ARGV[0]).each_line do |line|
  ary_swaps = parse_line(line.strip)
  puts do_swaps(ary_swaps[0], ary_swaps[1]).join(' ') 
end

# tests
=begin
p parse_line('1 2 3 4 5 6 7 8 9 : 0-8') == [[1, 2, 3, 4, 5, 6, 7, 8, 9], [[0, 8]]]
p parse_line('1 2 3 4 5 6 7 8 9 10 : 0-1, 1-3') == [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [[0, 1], [1, 3]]]
p do_swaps([1, 2, 3, 4, 5, 6, 7, 8, 9], [[0, 8]]).join(' ') == '9 2 3 4 5 6 7 8 1'
ary_swaps = parse_line('1 2 3 4 5 6 7 8 9 10 : 0-1, 1-3') 
p do_swaps(ary_swaps[0], ary_swaps[1]).join(' ') == '2 4 3 1 5 6 7 8 9 10'
=end