# https://www.codeeval.com/browse/101/

Point = Struct.new(:x, :y)

def parse_input(input)
  points = input.gsub(/[\(\)]/, '').split(', ').map { |coord| coord.split(',').map(&:to_i) }
  
  points.map do |point|
    Point.new(point.first, point.last)
  end
end

def square?(points)
  max_x = points.max { |p1, p2| p1.x <=> p2.x }.x
  max_y = points.max { |p1, p2| p1.y <=> p2.y }.y

  # check for level square
  if points.count { |point| point.x == max_x } == 2 && points.count { |point| point.y == max_y } == 2

    return true
  end

  a = points.max { |p1, p2| p1.y <=> p2.y }
  points.delete_at(points.find_index(a))
  
  b = points.max { |p1, p2| p1.x <=> p2.x }
  points.delete_at(points.find_index(b))
  
  c = points.min { |p1, p2| p1.y <=> p2.y }
  points.delete_at(points.find_index(c))
  
  d = points.min { |p1, p2| p1.x <=> p2.x }

  a.x + c.x == b.x + d.x && a.y + c.y == b.y + d.y && a.y - c.y == b.x - d.x
end

File.open(ARGV[0]).each_line do |line|

  puts square?(parse_input(line.strip))
end

# tests
# p parse_input('(1,6), (6,7), (2,7), (9,1)')
# p square?('(0,1), (1,2), (2,1), (1,0)') == true
# p square?('(1,6), (6,7), (2,7), (9,1)') == false
# p square?('(4,1), (3,4), (0,5), (1,2)') == false
# p square?('(4,6), (5,5), (5,6), (4,5)') == true
