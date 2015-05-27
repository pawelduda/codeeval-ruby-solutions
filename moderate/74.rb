# https://www.codeeval.com/browse/74/

COIN_VALUES = [5, 3, 1]

def minimum_coins(sum)
  coins_number = 0

  COIN_VALUES.each do |coin|
    if sum >= coin
      sum -= coin
      coins_number += 1
      redo
    else
      next
    end
  end

  coins_number
end

File.open(ARGV[0]).each_line do |line|
  puts minimum_coins(line.to_i)
end

# tests
# p minimum_coins(11) == 3
# p minimum_coins(20) == 4
