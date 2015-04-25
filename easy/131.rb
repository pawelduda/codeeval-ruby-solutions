# https://www.codeeval.com/browse/131/

def exec_pattern_on_num(num, pattern)
  a = pattern.match('^[a-z]+').to_s.split('')
  b = pattern.match('[a-z]+$').to_s.split('')
  operation = pattern.include?('+') ? :+ : :-

  map_pattern_to_number(a, num).send(operation, map_pattern_to_number(b, num))
end

def map_pattern_to_number(pattern, num)
  # mapping_table = ('a'..'z').to_a.zip(0..25).to_h
  # to_h() doesn't work in Ruby 1.9.3, workaround: 
  mapping_table = {}; 
  ('a'..'z').to_a.zip(0..25).map { |elem| mapping_table[elem[0]] = elem[1] }
  
  pattern.map do |x|
    num[mapping_table[x]]
  end.join.to_i
end

File.open(ARGV[0]).each_line do |line|
  num, pattern = line.strip.split(' ')
  puts exec_pattern_on_num(num, pattern).to_s
end

# tests
=begin
p exec_pattern_on_num('3413289830', 'a-bcdefghij') == -413289827
p exec_pattern_on_num('776', 'a+bc') == 83
p exec_pattern_on_num('12345', 'a+bcde') == 2346
p exec_pattern_on_num('1232', 'ab+cd') == 44
p exec_pattern_on_num('90602', 'a+bcde') == 611
=end