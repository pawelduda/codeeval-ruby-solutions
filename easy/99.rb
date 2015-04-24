
def str_to_points_ary(str)
  str.split(') (').map do |point_str|
    point_str.gsub(/\(|\)/, '').split(', ').map(&:to_i)
  end
end

def get_distance(points_ary)
  horizontal_dist = points_ary[0][0] - points_ary[1][0]
  vertical_dist = points_ary[0][1] - points_ary[1][1]

  Math.sqrt(horizontal_dist**2 + vertical_dist**2).to_i
end

File.open(ARGV[0]).each_line do |line|
  puts get_distance(str_to_points_ary(line))
end

# tests
=begin
p str_to_points_ary('(25, 4) (1, -6)') == [[25, 4], [1, -6]]
p get_distance([[25, 4], [1, -6]]) == 26
p get_distance([[47, 43], [-25, -11]]) == 90
=end
