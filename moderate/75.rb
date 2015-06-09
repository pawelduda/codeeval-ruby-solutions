# https://www.codeeval.com/browse/75/

def parse_input(input)
  input = input.split(',').map(&:to_i)
  {
    people_amount: input[0],
    n: input[1]
  }
end

def print_order_of_executed(people_amount, n)
end

# tests
p print_order_of_executed(10, 3) == '2 5 8 1 6 0 7 4 9 3'
p print_order_of_executed(5, 2) == '1 3 0 4 2'

