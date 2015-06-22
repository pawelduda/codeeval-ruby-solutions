# https://www.codeeval.com/browse/54/

BILLS_COINS = {
  'ONE HUNDRED' => 100.00,
  'FIFTY' => 50.00,
  'TWENTY' => 20.00,
  'TEN' => 10.00,
  'FIVE' => 5.00,
  'TWO' => 2.00,
  'ONE' => 1.00,
  'HALF DOLLAR' => 0.50,
  'QUARTER' => 0.25,
  'DIME' => 0.10,
  'NICKEL' => 0.05,
  'PENNY' => 0.01
}

def parse_input(input)
  input = input.split(';').map(&:to_f)
  {
    purchase_price: input[0],
    cash_given: input[1]
  }
end

def change_for(purchase_price, cash_given)
  return 'ERROR' if purchase_price > cash_given
  
  change_left = (cash_given - purchase_price).round(2)
  change_literal = []

  BILLS_COINS.each_pair do |name, bill|
    if bill <= change_left
      change_left = (change_left - bill).round(2)
      change_literal << name
      redo
    end
  end

  change_literal.length > 0 ? change_literal.join(',') : 'ZERO'
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line)
  puts change_for(input[:purchase_price], input[:cash_given])
end

# tests
# p parse_input('15.94;16.00')
# p parse_input('45;50')
# p change_for(15.94, 16.00) == 'NICKEL,PENNY'
# p change_for(17.0, 16.0) == 'ERROR'
# p change_for(35.0, 35.0) == 'ZERO'
# p change_for(45.0, 50.0) == 'FIVE' 
