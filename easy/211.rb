# https://www.codeeval.com/browse/211/
# TODO: refactor

def parse_input(input)
  input = input.split(' | ')
  {
    wines: input[0].split(' '),
    remembered_letters: input[1]
  }
end

def wines(wines, remembered_letters)
  wines.map! do |name|
    contains_letters = true    
    name_letters = name.chars.to_a

    remembered_letters.chars.each do |remembered_letter|
      index = name_letters.find_index(remembered_letter)
      index.nil? ? contains_letters = false : name_letters[index] = nil
      break unless contains_letters
    end

    contains_letters ? name : nil
  end 

  wines.compact!
  wines.length > 0 ? wines.join(' ') : 'False'
end

File.open(ARGV[0]).each_line do |line| 
  input = parse_input(line.strip)
  puts wines(input[:wines], input[:remembered_letters])
end

# tests
# input = parse_input('Cabernet Merlot Noir | ot')
# p wines(input[:wines], input[:remembered_letters]) == 'Merlot'

# input = parse_input('Chardonnay Sauvignon | ann')
# p wines(input[:wines], input[:remembered_letters]) == 'Chardonnay Sauvignon'

# input = parse_input('Shiraz Grenache | o')
# p wines(input[:wines], input[:remembered_letters]) == 'False'
