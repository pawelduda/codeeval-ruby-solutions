# https://www.codeeval.com/browse/70/

def parse_input(input)
  input = input.split(',').map(&:to_i)
  {
    rect1: input[0..3],
    rect2: input[4..7]
  }
end

def rectangles_overleap?(rect1, rect2)
  #             -3          -1       1          3
  x_coords = [rect1[0], rect1[2], rect2[0], rect2[2]]
  y_coords = [rect1[1], rect1[3], rect2[1], rect2[3]]

  if x_coords[0].between?(x_coords[2], x_coords[3]) || x_coords[1].between?(x_coords[2], x_coords[3])
    return 'True'
  end

  if y_coords[0].between?(y_coords[2], y_coords[3]) || y_coords[1].between?(y_coords[2], y_coords[3])
    return 'True'
  end

  'False'
end

# File.open(ARGV[0]).each_line do |line|
#   input = parse_input(line)
#   puts rectangles_overleap?(input[:rect1], input[:rect2])
# end

# tests 
p parse_input('-3,3,-1,1,1,-1,3,-3')
p rectangles_overleap?([-3, 3, -1, 1], [1, -1, 3, -3])
p rectangles_overleap?([-3, 3, -1, 1], [-2, 4, 2, 2])
