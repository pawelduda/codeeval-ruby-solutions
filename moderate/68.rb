# https://www.codeeval.com/browse/68/

PARENTHESES = [
  ['(', ')'],
  ['[', ']'],
  ['{', '}']
]

def well_formed?(text)
  parentheses_count = Hash.new(0)

  text.chars { |char| parentheses_count[char] += 1 }
  PARENTHESES.each { |pair| return 'False' if parentheses_count[pair[0]] != parentheses_count[pair[1]] }
  'True'
end

# tests
p well_formed?('()') == 'True'
p well_formed?('[()') == 'False'
p well_formed?('{{[}}]') == 'True'
