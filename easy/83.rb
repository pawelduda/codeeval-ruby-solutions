# https://www.codeeval.com/browse/83/

def get_string_beauty(str)
  letters = Hash.new { |h, k| h[k] = 0 }
  
  str.downcase.gsub(/[^a-z]/, '').split('').each do |l|
    letters[l] += 1
  end

  beauty_sum = 0
  beauty_inc = 26
  letters.sort_by { |key, val| -val }.each do |key, count|
    beauty_sum += beauty_inc * count
    beauty_inc -= 1
  end

  beauty_sum
end

File.open(ARGV[0]).each_line do |line|
  puts get_string_beauty(line)
end

# tests
=begin
p get_string_beauty('ABbCcc') == 152
p get_string_beauty('Good luck in the Facebook Hacker Cup this year!') == 754
p get_string_beauty('Ignore punctuation, please :)') == 491
p get_string_beauty('Sometimes test cases are hard to make up.') == 729
p get_string_beauty('So I just go consult Professor Dalves') == 646
=end