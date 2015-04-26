# https://www.codeeval.com/browse/147/

def get_case_stats(str)
  upcase = 0
  downcase = 0

  str.split('').each do |c|
    c == c.upcase ? upcase += 1 : downcase += 1
  end

  upcase_percent = '%.2f' % (upcase.to_f * 100 / str.length)
  downcase_percent = '%.2f' % (downcase.to_f * 100 / str.length)

  "lowercase: #{downcase_percent} uppercase: #{upcase_percent}"
end

File.open(ARGV[0]).each_line do |line|
  puts get_case_stats(line.strip)
end

# tests
=begin
p get_case_stats('thisTHIS') == 'lowercase: 50.00 uppercase: 50.00'
p get_case_stats('AAbbCCDDEE') == 'lowercase: 20.00 uppercase: 80.00'
p get_case_stats('N') == 'lowercase: 0.00 uppercase: 100.00'
p get_case_stats('UkJ') == 'lowercase: 33.33 uppercase: 66.67'
=end