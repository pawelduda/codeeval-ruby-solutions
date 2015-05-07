# https://www.codeeval.com/browse/189/

def minimum_distance(numbers)
  houses = numbers.split(' ')[1..-1].map(&:to_i)
  min_distance = Float::INFINITY

  houses.each do |house|
    total_distance = houses.inject(0) do |total_distance, other_house|
      total_distance + (house - other_house).abs
    end
    min_distance = total_distance if min_distance > total_distance
  end

  min_distance
end

File.open(ARGV[0]).each_line do |line|
  puts minimum_distance(line.strip)
end

# tests
=begin
p minimum_distance('4 3 3 5 7') == 6
p minimum_distance('3 20 30 40') == 20
=end
