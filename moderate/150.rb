# https://www.codeeval.com/browse/150/

ARABIC_TO_ROMAN = {
  'M' => 1000,
  'D' => 500,
  'C' => 100,
  'L' => 50,
  'X' => 10,
  'V' => 5,
  'I' => 1
}

def to_decimal(aromatic_number)
  prev_base = 0
  result = 0
  
  aromatic_number.chars.each_slice(2).to_a.reverse.each do |pair|
    part = pair[0].to_i * ARABIC_TO_ROMAN[pair[1]]
    operator = ARABIC_TO_ROMAN[pair[1]] < prev_base ? :- : :+
    
    result = result.send(operator, part)
    
    prev_base = ARABIC_TO_ROMAN[pair[1]]
  end

  result
end

File.open(ARGV[0]).each_line { |line| puts to_decimal(line.strip) }

# tests
# p to_decimal('3M1D2C') == 3700
# p to_decimal('2I3I2X9V1X') == -16
