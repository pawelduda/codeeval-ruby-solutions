# https://www.codeeval.com/browse/101/

def parse_input(input)
  input.gsub(/[\(\)]/, '').split(', ').map { |coord| coord.split(',').map(&:to_i) }
end

def square?(points)
  points = parse_input(points)

  center_x = points.map(&:first).reduce(:+).to_f / 4
  center_y = points.map(&:last).reduce(:+).to_f / 4
  center = [center_x, center_y]

  vec = [center_x - points[0].first, center_y - points[0].last]
  vec_2 = [-vec[1], vec[0]]

  points[2] == [center.first - vec.first, center.last - vec.last]
  points[2] == [center.first + vec_2.first, center.last + vec_2.last]
  points[3] == [center.first - vec_2.first, center.last - vec_2.last]
end

# tests
p parse_input('(1,6), (6,7), (2,7), (9,1)') == [[1, 6], [6, 7], [2, 7], [9, 1]]
p square?('(1,6), (6,7), (2,7), (9,1)') == false
p square?('(4,1), (3,4), (0,5), (1,2)') == false
p square?('(4,6), (5,5), (5,6), (4,5)') #== true
