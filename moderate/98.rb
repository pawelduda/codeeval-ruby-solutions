# https://www.codeeval.com/browse/98/

class Circle
  attr_reader :x, :y, :radius, :point_x, :point_y

  def initialize(input)
    input = parse_input(input)
    @x = input[:x]
    @y = input[:y]
    @radius = input[:radius]
    @point_x = input[:point_x]
    @point_y = input[:point_y]
  end

  def is_point_inside_the_circle?
    (x - point_x)**2 + (y - point_y)**2 < radius**2
  end

  private

  def parse_input(input)
    data = /Center: \(([\d.-]+), ([\d.-]+)\); Radius: ([\d.-]+); Point: \(([\d.-]+), ([\d.-]+)\)/.match(input)

    {
      x: data[1].to_f,
      y: data[2].to_f,
      radius: data[3].to_f,
      point_x: data[4].to_f,
      point_y: data[5].to_f
    }
  end
end

File.open(ARGV[0]).each_line { |line| puts Circle.new(line).is_point_inside_the_circle? }

# tests
# p Circle.new('Center: (2.12, -3.48); Radius: 17.22; Point: (16.21, -5)').is_point_inside_the_circle? == true
# p Circle.new('Center: (5.05, -11); Radius: 21.2; Point: (-31, -45)').is_point_inside_the_circle? == false
# p Circle.new('Center: (-9.86, 1.95); Radius: 47.28; Point: (6.03, -6.42)').is_point_inside_the_circle? == true
