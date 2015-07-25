# https://www.codeeval.com/browse/206/

def split_number(number)

end

def digits(number)
  zeros_count = number[0] == '0' ? number.match(/^0+/)[0].length : 0
  number = number.to_i.abs
  [].tap do |result|
    while number > 0 
      divmod_result = number.divmod(10)
      number = divmod_result[0]
      digit = divmod_result[1]
      # number, digit = number.divmod(10)
      result.unshift(digit)
    end
    result.unshift([0] * zeros_count) if zeros_count > 0
  end
end

# def digits(number)
  # number.to_s.split('').map(&:to_i)
  # return 0 if number == 0
#   Math.log10(number).floor
#   Math.log10(number).floor.downto(0).map { |i| number == 0 ? 0 : (number / 10**i) % 10 }
# end

def lucky_ticket?(digits)
  # return true if digits == 0
  size = digits.size
  p digits if digits[0..size / 2 - 1].reduce(:+) == digits[size / 2..size - 1].reduce(:+)
  digits[0..size / 2 - 1].reduce(:+) == digits[size / 2..size - 1].reduce(:+)
end

def lucky_tickets_amount_for_length(length)
  sum = 0
  (('0'.*length)..('9'*length)).each { |number| sum += 1 if lucky_ticket?(digits(number)) }
  sum
end

# tests
# p digits('00') == [0, 0]
# p lucky_ticket?(digits('328940')) == true
p lucky_tickets_amount_for_length(2) == 10
p lucky_tickets_amount_for_length(4) == 670
# p lucky_tickets_amount_for_length(6) == 55252
# p lucky_tickets_amount_for_length(8) == 4816030 
