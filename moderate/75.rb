# https://www.codeeval.com/browse/75/

def parse_input(input)
  input = input.split(',').map(&:to_i)
  {
    people_amount: input[0],
    n: input[1]
  }
end

def print_order_of_executed(people_amount, n)
  people = (0..people_amount - 1).to_a
  current_position = 0
  people_execution_order = []

  until people_execution_order.length == people_amount
    current_position = next_position(current_position, n, people.length)
    people_execution_order << people[current_position]

    people.delete_at(current_position)
    people.compact!
  end

  people_execution_order.join(' ')
end

def next_position(current_position, n, people_amount)
  # -1 compensates the last deleted element
  current_position = current_position - 1 + n
  # loop the array if current_position goes out of bounds
  current_position = current_position % people_amount if current_position >= people_amount

  current_position
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line.strip)
  puts print_order_of_executed(input[:people_amount], input[:n])
end

# tests
# p print_order_of_executed(10, 3) == '2 5 8 1 6 0 7 4 9 3'
# p print_order_of_executed(5, 2) == '1 3 0 4 2'

# ^ [0, 1, 2, 3, 4]
#   [0, ^, 2, 3, 4]
#   [0, *, 2, ^, 4]
#   [^, *, 2, *, 4]
#   [*, *, 2, *, ^]
#   [*, *, ^, *, *]
# 
#   [1, 3, 0, 4, 2]
