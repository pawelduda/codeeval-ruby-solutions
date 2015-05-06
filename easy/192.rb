# https://www.codeeval.com/browse/192/

def get_direction(coords)
  coords = coords.split(' ').map(&:to_i)
  current_coords = coords[0..1]
  target_coords = coords[2..3]
  direction = ''

  return 'here' if current_coords == target_coords

  if current_coords[1] > target_coords[1]
    direction << 'S'
  elsif current_coords[1] < target_coords[1]
    direction << 'N'
  end

  if current_coords[0] > target_coords[0]
    direction << 'W'
  elsif current_coords[0] < target_coords[0]
    direction << 'E'
  end

  direction  
end

File.open(ARGV[0]).each_line do |line|
  puts get_direction(line.strip)
end

# tests
=begin
p get_direction('0 0 1 5') == 'NE'
p get_direction('12 13 12 13') == 'here'
p get_direction('0 1 0 5') == 'N'
=end
