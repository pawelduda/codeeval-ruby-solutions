# https://www.codeeval.com/browse/13/

def parse_input(input)
  input = input.split(', ')
  {
    input: input[0],
    characters_to_remove: input[1].split('')
  }
end

def remove_characters(args) 
  args[:characters_to_remove].each do |to_be_removed|
    args[:input].gsub!(to_be_removed, '')
  end

  args[:input]
end

File.open(ARGV[0]).each_line do |line|
  puts remove_characters(parse_input(line))
end

# tests
# p remove_characters(parse_input('how are you, abc')) == 'how re you'
# p remove_characters(parse_input('hello world, def')) == 'hllo worl'
