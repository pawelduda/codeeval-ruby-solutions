# https://www.codeeval.com/browse/63/

require 'prime'

def parse_input(input)
  input = input.split(',').map(&:to_i)
  {
    from: input[0],
    to: input[1]
  }
end

def primes_in_range(from, to)
  primes_amount = 0

  (from..to).each do |number|
    primes_amount += 1 if Prime.instance.prime?(number)
  end

  primes_amount
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line)
  puts primes_in_range(input[:from], input[:to])
end

# tests
# p primes_in_range(2, 10) == 4
# p primes_in_range(20, 30) == 2
