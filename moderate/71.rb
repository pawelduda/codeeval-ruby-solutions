# https://www.codeeval.com/browse/71/

def parse_input(input)
  input = input.split(';')
  {
    list: input[0].split(',').map(&:to_i),
    group_size: input[1].to_i
  }
end

def reverse_groups(list, group_size)
  list.each_slice(group_size).map do |slice|
    slice.length == group_size ? slice.reverse : slice
  end.flatten.join(',')
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line)
  puts reverse_groups(input[:list], input[:group_size])
end

# tests
# p parse_input('1,2,3,4,5;2') == { list: [1, 2, 3, 4, 5], group_size: 2 }
# p reverse_groups([1, 2, 3, 4, 5], 2) == '2, 1, 4, 3, 5'
# p reverse_groups([1, 2, 3, 4, 5], 3) == '3, 2, 1, 4, 5'
