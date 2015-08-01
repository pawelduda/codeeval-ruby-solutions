# https://www.codeeval.com/browse/146/

DISTANCE_FROM_ENDS = 6

def additional_bats_on_the_wire_count(wire_length, min_distance, *bats) 
  bats.sort!
  count_additional_bats(wire_length, min_distance, *bats)
end

def count_additional_bats(wire_length, min_distance, *bats)
  additional_bats_count = 0

  bats << DISTANCE_FROM_ENDS if bats.empty?

  bats.each do |bat|
    new_bat = bat - min_distance
    loop do
      break unless valid_bat?(new_bat, min_distance, wire_length, *bats)
      bats << new_bat
      additional_bats_count += 1

      new_bat -= min_distance
    end

    new_bat = bat + min_distance
    loop do
      break unless valid_bat?(new_bat, min_distance, wire_length, *bats)
      bats << new_bat 
      additional_bats_count += 1

      new_bat += min_distance
    end
  end

  additional_bats_count
end

def valid_bat?(bat, min_distance, wire_length, *bats)
  !bats.any? do |existing_bat|
    next if existing_bat == bat

    existing_bat.between?(bat, bat - min_distance) || 
    existing_bat.between?(bat, bat + min_distance) ||
    bat <= DISTANCE_FROM_ENDS ||
    bat >= wire_length - DISTANCE_FROM_ENDS 
  end
end

# tests
# p filter_out_bats_too_close_to_ends(13, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13) == [7]
p additional_bats_on_the_wire_count(22, 2, 11) == 3
p additional_bats_on_the_wire_count(33, 5) == 5
p additional_bats_on_the_wire_count(16, 3, 6, 10) == 0
p additional_bats_on_the_wire_count(835, 125, 113) #== 5
p additional_bats_on_the_wire_count(47, 5) == 8
