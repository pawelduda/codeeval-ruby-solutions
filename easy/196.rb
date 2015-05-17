# https://www.codeeval.com/browse/196/

def swap_surrounding_numbers(word)
  word.split(/(\d+)([A-Za-z]+)(\d+)/)[1..-1].reverse.join
end

def process_line(words)
  words.split(' ').map do |word|
    swap_surrounding_numbers(word)
  end.join(' ')
end

File.open(ARGV[0]).each_line do |line|
  puts process_line(line)
end

# tests
=begin
p process_line('4Always0 5look8 4on9 7the2 4bright8 9side7 3of8 5life5') == '0Always4 8look5 9on4 2the7 8bright4 7side9 8of3 5life5'
p process_line('5Nobody5 7expects3 5the4 6Spanish4 9inquisition0') == '5Nobody5 3expects7 4the5 4Spanish6 0inquisition9'
=end
