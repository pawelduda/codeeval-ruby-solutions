# https://www.codeeval.com/browse/70/

Point = Struct.new(:x, :y)
Rectangle = Struct.new(:top_left, :bot_right)

def parse_input(input)
  input = input.split(',').map(&:to_i)
  [
    Rectangle.new(Point.new(input[0], input[1]), Point.new(input[2], input[3])),
    Rectangle.new(Point.new(input[4], input[5]), Point.new(input[6], input[7]))
  ]
end

def rectangles_overleap?(rect1, rect2)
  return 'False' if rect1.top_left.x > rect2.bot_right.x || rect2.top_left.x > rect1.bot_right.x ||
                    rect1.top_left.y < rect2.bot_right.y || rect2.top_left.y < rect1.bot_right.y 
  'True'
end

File.open(ARGV[0]).each_line do |line|
  rects = parse_input(line)
  puts rectangles_overleap?(rects[0], rects[1])
end

# tests 
# rects = parse_input('-3,3,-1,1,1,-1,3,-3')
# p rectangles_overleap?(rects[0], rects[1]) == 'False'
# rects = parse_input('-3,3,-1,1,-2,4,2,2')
# p rectangles_overleap?(rects[0], rects[1]) == 'True'
