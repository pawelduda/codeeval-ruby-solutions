# https://www.codeeval.com/browse/122/

hidden_digits_table = {
  'a' => 0,
  'b' => 1,
  'c' => 2,
  'd' => 3,
  'e' => 4,
  'f' => 5,
  'g' => 6,
  'h' => 7,
  'i' => 8,
  'j' => 9
}

def find_all_digits(str, table)
  ary = str.split('').map do |s|
    if s =~ /\d+/
      s
    elsif table[s]
      table[s]
    end
  end.compact.join

  ary.length > 0 ? ary : 'NONE'
end

File.open(ARGV[0]).each_line do |line|
  puts find_all_digits(line.strip, hidden_digits_table)
end

# tests
=begin
p find_all_digits('abcdefghik', hidden_digits_table) == '012345678'
p find_all_digits('Xa,}A#5N}{xOBwYBHIlH,#W', hidden_digits_table) == '05'
p find_all_digits("(ABW>'yy^'M{X-K}q,", hidden_digits_table) == 'NONE'
p find_all_digits('6240488', hidden_digits_table) == '6240488'
=end