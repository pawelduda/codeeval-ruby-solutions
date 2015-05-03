# https://www.codeeval.com/browse/149/

def sequence_to_number(sequence)
  sequence.split(' ').each_slice(2).to_a.map do |sequence|
    if sequence[0] == '0'
      sequence[1]
    elsif sequence[0] == '00'
      sequence[1].gsub!('0', '1') 
    end
  end.join.to_i(2)
end 

File.open(ARGV[0]).each_line do |line|
  puts sequence_to_number(line.strip)
end

# tests
=begin
p sequence_to_number('00 0 0 00 00 0') == 9
p sequence_to_number('00 0') == 1
p sequence_to_number('00 0 0 000 00 0000000 0 000') == 9208
p sequence_to_number('0 000000000 00 00') == 3
=end
