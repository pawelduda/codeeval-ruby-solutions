# https://www.codeeval.com/browse/41/

def parse_input(input)
  input = input.split(';')
  {
    count: input[0].to_i,
    numbers: input[1].split(',').map(&:to_i).sort
  }
end

def find_duplicate(numbers)
  numbers.each { |number| return number if numbers.count(number) > 1 }
end

File.open(ARGV[0]).each_line do |line|
  puts find_duplicate(parse_input(line)[:numbers])
end

# tests
# p find_duplicate(parse_input('5;0,1,2,3,0')[:numbers]) == 0
# p find_duplicate(parse_input('20;0,1,10,3,2,4,5,7,6,8,11,9,15,12,13,4,16,18,17,14')[:numbers]) == 4
