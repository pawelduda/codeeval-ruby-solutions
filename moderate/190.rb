# https://www.codeeval.com/browse/190/

POSSIBLE_OPERATORS_ORDERS = [:+, :-, :*].repeated_permutation(4).to_a

def parse_input(input)
  input.split(' ').map(&:to_i)
end

def can_be_rearranged_to_give_42?(numbers)
  numbers = numbers.permutation.to_a

  numbers.each do |numbers_order|
    POSSIBLE_OPERATORS_ORDERS.each { |operators_order| return 'YES' if equal_42?(numbers_order, operators_order) }
  end

  'NO'
end

def equal_42?(numbers_order, operators_order)
  result = numbers_order[0]

  numbers_order.each_with_index do |number, i|
    next if i == 0
    result = result.send(operators_order[i - 1], numbers_order[i])
  end

  result == 42
end

File.open(ARGV[0]).each_line { |line| puts can_be_rearranged_to_give_42?(parse_input(line)) }

# tests
# p equal_42?([1, 2, 3, 4, 5], [:+, :-, :*, :+]) == false
# p equal_42?([5, 20, 60, 3, 1], [:*, :-, :+, :-]) == true
# p can_be_rearranged_to_give_42?(parse_input('20 60 3 5 1')) == 'YES'
# p can_be_rearranged_to_give_42?(parse_input('44 6 1 49 47')) == 'NO'
# p can_be_rearranged_to_give_42?(parse_input('34 1 49 2 21')) == 'YES'
# p can_be_rearranged_to_give_42?(parse_input('31 38 27 51 18')) == 'NO'
