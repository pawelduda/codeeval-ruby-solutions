# https://www.codeeval.com/browse/106/
#
# This program actually does the opposite to what CodeEval challenge
# says - it converts Roman numerals to cardinal numbers.

ROMAN_NUMERALS = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}

def split_roman_numeral(roman)
  # Divide into single 'letters'.
  roman_parts = roman.split('')

  # Check all adjacent pairs.
  # If any of them uses the substractive notation, join them.
  last_match_substractive = false
  roman_parts.map.with_index(1) do |roman_part, i|
    left_part = roman_part
    right_part = roman_parts[i]

    if is_substractive_notation?([left_part, right_part])
      last_match_substractive = true
      [left_part, right_part].join
    elsif last_match_substractive
      last_match_substractive = false
      nil
    else
      left_part
    end
  end.compact
end

def is_substractive_notation?(roman_pair)
  return false if roman_pair[1].nil?
  ROMAN_NUMERALS[roman_pair[0]] < ROMAN_NUMERALS[roman_pair[1]]
end

def roman_part_to_cardinal(roman_part)
  if roman_part.length == 1
    ROMAN_NUMERALS[roman_part]
  elsif roman_part.length == 2
    # We are dealing with substractive notation.
    digits_pair = roman_part.split('')
    ROMAN_NUMERALS[digits_pair[1]] - ROMAN_NUMERALS[digits_pair[0]]
  end
end

def to_cardinal(roman)
  roman = split_roman_numeral(roman)
  roman.inject(0) do |sum, x|
    sum += roman_part_to_cardinal(x)
  end
end

File.open(ARGV[0]).each_line do |line|
  puts to_cardinal(line.strip)
end

# tests
# p roman_part_to_cardinal('V') == 5
# p roman_part_to_cardinal('M') == 1000
# p roman_part_to_cardinal('IV') == 4
# p roman_part_to_cardinal('IX') == 9
# p roman_part_to_cardinal('XL') == 40
# p roman_part_to_cardinal('XC') == 90
# p split_roman_numeral('M') == %w(M)
# p split_roman_numeral('IV') == %w(IV)
# p split_roman_numeral('IVIX') == %w(IV IX)
# p split_roman_numeral('MDCLXVI') == %w(M D C L X V I)
# p split_roman_numeral('MMDXVIIV') == %w(M M D X V I IV)
# p split_roman_numeral('CLIX') == %w(C L IX)
# p to_cardinal('CLIX') == 159
# p to_cardinal('CCXCVI') == 296
# p to_cardinal('MMMCMXCII') == 3992
