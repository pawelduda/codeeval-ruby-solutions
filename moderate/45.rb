# https://www.codeeval.com/browse/45/

class String
  def palindrome?
    self == self.reverse    
  end
end

def reverse_palindrome(number)
  additions = 0

  until (number_as_string = number.to_s).palindrome?
    number += number_as_string.reverse.to_i
    additions += 1
  end

  additions.to_s + ' ' + number_as_string
end

File.open(ARGV[0]).each_line do |line|
  puts reverse_palindrome(line.to_i)
end

# tests
# p '9119'.palindrome? == true
# p '19'.palindrome? == false
# p reverse_palindrome(195) == '4 9339'
