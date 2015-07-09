# https://www.codeeval.com/browse/76/

def parse_input(input)
  input = input.split(',')
  {
    original: input[0],
    rotated: input[1]
  }
end

class String
  def is_rotation_of?(another_string)
    original_length = self.length - 1
    doubled_self = self * 2

    (0..original_length).each do |rotation|
      return 'True' if doubled_self[rotation..(rotation + original_length)] == another_string
    end

    'False'
  end
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line.strip)
  puts input[:original].is_rotation_of?(input[:rotated])
end

# tests
# p 'Hello'.is_rotation_of?('lloHe') == 'True'
# p 'Basefont'.is_rotation_of?('tBasefon') == 'True'
