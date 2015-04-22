# https://www.codeeval.com/browse/2/

def get_required_lines_num(str)
  str.lines.first.to_i
end

def sort_lines_by_length_desc(str)
  lines_ary = []
  str.each_line do |line|
    next if str.lines.first == line
    lines_ary.push(line.chomp)
  end

  lines_ary.sort_by(&:length).reverse
end

def get_longest_lines(str)
  # first read required number of resulting longest lines from str,
  # then print each in a single line 
  sort_lines_by_length_desc(str)[0..get_required_lines_num(str) - 1].join("\n")
end

puts get_longest_lines(File.open(ARGV[0]).read)

# tests
=begin
test_file = '2
Hello World
CodeEval
Quick Fox
A
San Francisco
'
p get_required_lines_num(test_file) == 2
p sort_lines_by_length_desc(test_file) == ["San Francisco", "Hello World", "Quick Fox", "CodeEval", "A"]
puts get_longest_lines(test_file) == 'San Francisco
Hello World'
=end
