# https://www.codeeval.com/browse/32/

def trailing_string?(string, suffix)
  string[-suffix.length..string.length - 1] == suffix ? 1 : 0
end

def parse_input(input)
  input = input.split(',')
  {
    string: input[0],
    suffix: input[1]
  }
end

# File.open(ARGV[0]).each_line do |line|
#   input = parse_input(line)
#   puts trailing_string?(input[:string], input[:suffix])
# end

# tests
p input = parse_input('Hello World,World')
p trailing_string?(input[:string], input[:suffix])
# p trailing_string?('Hello CodeEval', 'CodeEval')
# p trailing_string?('San Francisco', 'San Jose')
