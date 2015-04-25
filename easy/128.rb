# https://www.codeeval.com/browse/128/

def compress_sequence(sequence)
  out = []
  num_ary = sequence.split(' ')

  # start from first number
  count = 0
  cur = num_ary[0]
  
  while num_ary.length > 0 do
    if num_ary[0] == cur
      count += 1
    else
      out << count.to_s << cur
      count = 1
      cur = num_ary[0]
    end

    num_ary.shift
  end

  # add last part and return
  (out << count.to_s << cur).join(' ')
end

File.open(ARGV[0]).each_line do |line|
  puts compress_sequence(line.strip)
end

# tests
=begin
p compress_sequence('40 40 40 40 29 29 29 29 29 29 29 29 57 57 92 92 92 92 92 86 86 86 86 86 86 86 86 86 86') == '4 40 8 29 2 57 5 92 10 86'
p compress_sequence('73 73 73 73 41 41 41 41 41 41 41 41 41 41') == '4 73 10 41'
p compress_sequence('1 1 3 3 3 2 2 2 2 14 14 14 11 11 11 2') == '2 1 3 3 4 2 3 14 3 11 1 2'
p compress_sequence('7') == '1 7'
=end