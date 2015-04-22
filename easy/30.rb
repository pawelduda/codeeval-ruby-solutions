# https://www.codeeval.com/browse/30/

def split_lists(str)
  lists = []
  str.split(';').each do |list|
    lists << list.split(',').map(&:to_i)  
  end

  lists
end

def get_lists_intersection(str)
  lists = split_lists(str)
  result = (lists[0] & lists[1])
  result.size > 0 ? result.join(',') : '' 
end

File.open(ARGV[0]).each_line do |line|
  puts get_lists_intersection(line)
end

# tests
=begin
p split_lists('1,2,3,4;4,5,6') == [[1, 2, 3, 4], [4, 5, 6]]
p get_lists_intersection('1,2,3,4;4,5,6') == '4'
p get_lists_intersection('20,21,22;45,46,47') == ''
p get_lists_intersection('7,8,9;8,9,10,11,12') == '8,9'
=end