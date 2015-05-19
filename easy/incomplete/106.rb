# https://www.codeeval.com/browse/106/

ROMAN_NUMERALS = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}

def digit_cardinal_to_roman(cardinal_digit)
  ROMAN_NUMERALS[cardinal_digit]
end

def split_roman_number(roman_number)
  # Divide into single digits
  roman_digits = roman_number.split('')

  # Check all adjacent pairs
  # If any of them uses substractive notation, join them
  roman_digits.unshift(roman_number[0])
  roman_digits.map.with_index(1) do |roman_digit, i|
    left_digit = roman_digit
    right_digit = roman_digits[i]

    if is_substractive_notation?(left_digit, right_digit)
      [left_digit, right_digit].join
    else
      right_digit
    end
  end.compact

  # Check all pairs for substractive notation
  # roman_number.split('').map.with_index(1) do |roman_digit, i|
    # [roman_digit, roman_number[i]].join
  # end[0..-2]
end

def is_substractive_notation?(left_digit, right_digit)
  return false if right_digit.nil?
  ROMAN_NUMERALS[left_digit] < ROMAN_NUMERALS[right_digit]
end

def process_substractive_notation(left_digit, right_digit)
  p left_digit, right_digit
end

def number_cardinal_to_roman(cardinal_number)
  current_part = ''
  cardinal_number.each_char do |digit|
    # p digit
  end
end

# tests
p digit_cardinal_to_roman('V') == 5
p digit_cardinal_to_roman('M') == 1000
p split_roman_number('MMDXVIIV') == %w(M M D X V I IV)
# p number_cardinal_to_roman('MMDXVII')
