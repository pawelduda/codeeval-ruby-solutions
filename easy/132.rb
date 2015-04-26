# https://www.codeeval.com/browse/132/

def get_major_element(sequence)
  # this does the job for now but runs too slow, needs refactoring:
  major_occurences = sequence.sort.chunk { |x| x }.map { |x| x }.sort_by { |x| x[1].length }.reverse[0][1]
  major_occurences.length > sequence.length / 2 ? major_occurences[0] : 'None'
end

File.open(ARGV[0]).each_line do |line|
  puts get_major_element(line.strip.split(','))
end

# tests:
=begin
p get_major_element('92,19,19,76,19,21,19,85,19,19,19,94,19,19,22,67,83,19,19,54,59,1,19,19'.split(',')) == '19'
p get_major_element('92,11,30,92,1,11,92,38,92,92,43,92,92,51,92,36,97,92,92,92,43,22,84,92,92'.split(',')) == '92'
p get_major_element('4,79,89,98,48,42,39,79,55,70,21,39,98,16,96,2,10,24,14,47,0,50,95,20,95,48,50,12,42'.split(',')) == 'None'
=end
