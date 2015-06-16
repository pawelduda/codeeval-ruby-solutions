# https://www.codeeval.com/browse/172/

def is_valid_card_number?(number)
  digits = credit_card_readable_to_processable(number)
  digits = multiple_every_second_from_right(digits)
  sum = sum_special(digits)
  sum % 10 == 0 ? 1 : 0
end

def credit_card_readable_to_processable(number)
  number.gsub(' ', '').chars.map(&:to_i)
end

def multiple_every_second_from_right(digits)
  digits.reverse.each_with_index.map { |digit, i| i.odd? ? digit * 2 : digit }.reverse
end

def sum_special(digits)
  digits.reverse.each_with_index.map do |number, i| 
    i.odd? ? sum_digits(number) : number 
  end.inject(0) { |sum, x| sum + x }
end

def sum_digits(number)
  number.to_s.split('').map(&:to_i).inject(0) { |sum, x| sum + x }
end

File.open(ARGV[0]).each_line do |line|
  puts is_valid_card_number?(line.strip)
end

# tests
# p credit_card_readable_to_processable('6011 5940 0319 9511') == 
#   [6, 0, 1, 1, 5, 9, 4, 0, 0, 3, 1, 9, 9, 5, 1, 1]
# p multiple_every_second_from_right([6, 0, 1, 1, 5, 9, 4, 0, 0, 3, 1, 9, 9, 5, 1, 1]) ==
#   [12, 0, 2, 1, 10, 9, 8, 0, 0, 3, 2, 9, 18, 5, 2, 1]
# p 24.to_s.split('').map(&:to_i).inject(0) { |sum, x| sum + x } == 6
# p sum_special([12, 0, 2, 1, 10, 9, 8, 0, 0, 3, 2, 9, 18, 5, 2, 1]) == 55 
# p is_valid_card_number?('6011 5940 0319 9511') == 0
# p is_valid_card_number?('5537 0213 6797 6815') == 1
# p is_valid_card_number?('5574 8363 8022 9735') == 0
# p is_valid_card_number?('3044 8507 9391 30') == 0
# p is_valid_card_number?('6370 1675 9034 6211 774') == 1
