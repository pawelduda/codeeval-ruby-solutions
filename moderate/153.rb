# https://www.codeeval.com/browse/153/
#
# doors:
# open - true
# locked - false

def parse_input(input)
  input = input.split(' ').map(&:to_i)
  {
    doors_amount: input[0],
    iterations_amount: input[1]
  }
end

def open
  true
end

def locked
  false
end

def create_open_doors(amount)
  Array.new(amount, open)
end

def lock(doors, door_number)
  doors[door_number] = locked
  doors
end

def toggle_lock(doors, door_number)
  doors[door_number] = !doors[door_number]
  doors
end

def lock_every_nth_door(doors, n)
  (0..doors.length - 1).select { |i| (i + 1) % n == 0 }.each do |i|
    doors = lock(doors, i)
  end
  doors
end

def toggle_every_nth_door(doors, n)
  (0..doors.length - 1).select { |i| (i + 1) % n == 0 }.each do |i|
    doors = toggle_lock(doors, i)
  end
  doors
end

def toggle_last_lock(doors)
  doors = toggle_lock(doors, doors.length - 1)
end

def unlocked_doors_count(doors)
  doors.select { |door| door == open }.count
end

def iterate(doors)
  doors = lock_every_nth_door(doors, 2)
  doors = toggle_every_nth_door(doors, 3)
end

def process_doors(doors, iterations_amount)
  (iterations_amount - 1).times { doors = iterate(doors) }
  doors = toggle_last_lock(doors)
  doors
end

File.open(ARGV[0]).each_line do |line|
  input = parse_input(line)
  doors = create_open_doors(input[:doors_amount])
  doors = process_doors(doors, input[:iterations_amount])
  puts unlocked_doors_count(doors)
end

# tests
# p open == true
# p locked == false
# p toggle_lock([open], 0) == [locked]
# p toggle_lock([locked], 0) == [open]
# p toggle_every_nth_door([open, open, open, open], 2) == [open, locked, open, locked]
# p toggle_every_nth_door([open, open, open, open], 3) == [open, open, locked, open]
# p toggle_last_lock([open, open, open, open]) == [open, open, open, locked]
# p iterate([open, open, open]) == [open, locked, locked]
# p process_doors([open, open, open], 1) == [open, open, locked]
# p unlocked_doors_count([open, locked, locked, locked]) == 1

# doors = create_open_doors(3)
# process_doors(doors, 1)
# p unlocked_doors_count(doors) == 2

# doors = create_open_doors(100)
# process_doors(doors, 100)
# p unlocked_doors_count(doors) == 50


