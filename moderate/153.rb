# o o o
# o i o
# o i i
# o i o

# https://www.codeeval.com/open_challenges/153/
# doors:
# open - true
# locked - false

def open
  true
end

def locked
  false
end

def toggle_lock(doors, door_number)
  doors[door_number] = !doors[door_number]
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

def locked_doors_count(doors)
  doors.select { |door| door == locked }.count
end

def iterate(doors)
  doors = toggle_every_nth_door(doors, 2)
  doors = toggle_every_nth_door(doors, 3)
  toggle_last_lock(doors)
end

def process_doors(doors, iterations_amount)
  iterations_amount.times { doors = iterate(doors) }
  doors
end

# tests
p open == true
p locked == false
p toggle_lock([open], 0) == [locked]
p toggle_lock([locked], 0) == [open]
p toggle_every_nth_door([open, open, open, open], 2) == [open, locked, open, locked]
p toggle_every_nth_door([open, open, open, open], 3) == [open, open, locked, open]
p toggle_last_lock([open, open, open, open]) == [open, open, open, locked]
p iterate([open, open, open]) == [open, locked, open]
p process_doors([open, open, open], 1) == [open, locked, open]
p locked_doors_count([open, locked, locked, locked]) == 3

p doors = Array.new(100, open)
p process_doors(doors, 100)
p locked_doors_count(doors) == 50
