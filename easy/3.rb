require 'prime'

def is_palindrome?(str)
  str == str.reverse
end

def largest_prime
  (1..1000).reverse_each do |x|
    if x.prime?
      return x if is_palindrome?(x.to_s)
    end
  end
end

p largest_prime