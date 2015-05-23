# https://www.codeeval.com/browse/106/

ROMAN_NUMERALS = {
  1000 => 'M',
  500 => 'D',
  100 => 'C',
  50 => 'L',
  10 => 'X',
  5 => 'V',
  1 => 'I'
}

ROMAN_REMAINDERS = {
  1000 => 'M',
  100 => 'C',
  10 => 'X',
  1 => 'I'
}

def to_roman(cardinal_number)
  cardinal_number.to_s.split('').reverse.each_with_index.map do |part, i|
    part = part.to_i * 10 ** i
    cardinal_part_to_roman(part) unless part == 0
  end.reverse.join
end

def cardinal_part_to_roman(cardinal_number)
  # If the numeral is found instantly, then there is no substractive notation.
  return ROMAN_NUMERALS[cardinal_number] if ROMAN_NUMERALS.include?(cardinal_number)

  # Otherwise check if we are dealing with substractive notation.
  roman = to_roman_with_substractive_notation(cardinal_number)
  return roman unless roman.nil?

  # If we made it to this point, there is no substractive notation, we should
  # be able to safely get the Roman numeral by decomposing the number.
  roman = to_roman_by_decomposing(cardinal_number)
  return roman
end

def to_roman_with_substractive_notation(cardinal_number)
  ROMAN_REMAINDERS.each do |roman_remainder, i|
    if ROMAN_NUMERALS.include?(roman_remainder + cardinal_number)
      return ROMAN_NUMERALS[roman_remainder] + ROMAN_NUMERALS[roman_remainder + cardinal_number]
    end
  end

  nil
end

def to_roman_by_decomposing(cardinal_number)
  roman = ''

  # Get the Roman numeral by substracting its parts from the cardinal_number.
  until cardinal_number == 0
    ROMAN_NUMERALS.each do |val, roman_numeral|
      if cardinal_number >= val
        cardinal_number -= val
        roman << roman_numeral
        redo
      end
    end
  end

  # Check if any symbol has more than 3 adjacent repetitions.
  # If that's the case, it means we shouldn't have made it to here.
  too_many_repetitions = roman.split('').group_by { |n| n }.map do |n|
    n[0] if n[1].length > 3
  end.compact

  if too_many_repetitions.length == 0
    return roman
  else
    raise "The Roman numeral #{roman} has more than 3 adjacent repetitions."
  end
end

File.open(ARGV[0]).each_line do |line|
  puts to_roman(line.strip)
end

# tests
# p cardinal_part_to_roman(1) == 'I'
# p cardinal_part_to_roman(2) == 'II'
# p cardinal_part_to_roman(3) == 'III'
# p cardinal_part_to_roman(4) == 'IV'
# p cardinal_part_to_roman(5) == 'V'
# p cardinal_part_to_roman(6) == 'VI'
# p cardinal_part_to_roman(7) == 'VII'
# p cardinal_part_to_roman(8) == 'VIII'
# p cardinal_part_to_roman(9) == 'IX'
# p cardinal_part_to_roman(10) == 'X'
# p cardinal_part_to_roman(100) == 'C'
# p cardinal_part_to_roman(1000) == 'M'
# p cardinal_part_to_roman(90) == 'XC'
# p cardinal_part_to_roman(900) == 'CM'
# p to_roman(159) == 'CLIX'
# p to_roman(296) == 'CCXCVI'
# p to_roman(3992) == 'MMMCMXCII'
# p to_roman(2021) == 'MMXXI'
