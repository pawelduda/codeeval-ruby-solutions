File.open(ARGV[0]).each_line do |line|
  line = line.split(',')
  result = line[0].index(line[1].strip)
  puts result.nil? ? '-1' : result 
end

# tests
=begin
test_str = 'What is your name,m'
line = line.split(',')
result = line[0].index(line[1].strip)
puts result.nil? ? '-1' : result
=end
