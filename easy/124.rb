# https://www.codeeval.com/browse/124/

def get_distances(cities)
  cities.split('; ').map do |city| 
    city.split(',')[1].to_i
  end.sort
end

def get_adjacent_distance(city1, city2)
  (city2 - city1).abs
end

def get_all_adjacent_distances(distances)
  # consider 0 as starting point
  adjacent_distances = []
  adjacent_distances << distances[0]

  (0..distances.length - 2).each do |i|
    adjacent_distances << get_adjacent_distance(distances[i], distances[i + 1])
  end

  adjacent_distances.join(',')
end

File.open(ARGV[0]).each_line do |line|
  puts get_all_adjacent_distances(get_distances(line.strip))
end

# tests
=begin
p get_all_adjacent_distances(get_distances('Rkbs,5453; Wdqiz,1245; Rwds,3890; Ujma,5589; Tbzmo,1303;')) == '1245,58,2587,1563,136'
p get_all_adjacent_distances(get_distances('Vgdfz,70; Mgknxpi,3958; Nsptghk,2626; Wuzp,2559; Jcdwi,3761;')) == '70,2489,67,1135,197'
p get_all_adjacent_distances(get_distances('Yvnzjwk,5363; Pkabj,5999; Xznvb,3584; Jfksvx,1240; Inwm,5720;')) == '1240,2344,1779,357,279'
p get_all_adjacent_distances(get_distances('Ramytdb,2683; Voclqmb,5236;')) == '2683,2553'
=end
