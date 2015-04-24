# https://www.codeeval.com/browse/107/
# TODO: refactor smallest_period(str)

def smallest_period(str)
  str_ary = str.split('')
  period = []

  while period.length < str.length do 
    period << str_ary.shift
    period_try = period.dup

    while period_try.length <= str.length do
      break if period_try.join != str[0..period_try.join.length - 1]
      return period.length if period_try.join.length == str.length && period_try.join == str       
      period_try << period.dup
    end
  end

  0
end

File.open(ARGV[0]).each do |line|
  puts smallest_period(line.strip)
end

# tests
=begin
p smallest_period('abcabcabcabc') == 3
p smallest_period('bcbcbcbcbcbcbcbcbcbcbcbcbcbc') == 2
p smallest_period('dddddddddddddddddddd') == 1
p smallest_period('adcdefg') == 7
=end