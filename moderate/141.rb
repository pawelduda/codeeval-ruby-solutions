# https://www.codeeval.com/browse/146/

DISTANCE_FROM_ENDS = 6

def additional_bats_on_the_wire_count(wire_length, min_distance, *bats) 
  bats.sort!
  bats = bats + fill_wire_with_bats(wire_length, min_distance, *bats)
  filter_out_bats_too_close_to_ends(wire_length, bats)
end

def fill_wire_with_bats(wire_length, min_distance, *bats)
  additional_bats = []
  additional_bats << bats[0] - min_distance
  # try adding adjacent bats
  bats.each_with_index do |bat, i|
    next if bats.length < 2
    additional_bats << bat + min_distance unless bats[i + 1] < bat + min_distance 
  end
  additional_bats << bats[-1] + min_distance
  additional_bats
end

def filter_out_bats_too_close_to_ends(wire_length, *bats)
  bats.delete_if { |bat| bat <= DISTANCE_FROM_ENDS || bat > wire_length - DISTANCE_FROM_ENDS }
end

# tests
p filter_out_bats_too_close_to_ends(13, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13) == [7]
p additional_bats_on_the_wire_count(22, 2, 11) #== 3
# p additional_bats_on_the_wire_count(33, 5) == 5
# p additional_bats_on_the_wire_count(16, 3, 6, 10) == 0
# p additional_bats_on_the_wire_count(835, 125, 113) == 5
# p additional_bats_on_the_wire_count(47, 0) == 8
