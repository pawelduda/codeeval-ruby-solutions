# https://www.codeeval.com/browse/115/

def separate_words_and_digits(str)
  digits_ary = []
  words_ary = []

  str.split(',').each do |elem|
    if elem =~ /\d+/ 
      digits_ary << elem
    else
      words_ary << elem
    end 
  end

  words_ary.join(',') << (words_ary.length > 0 && digits_ary.length > 0 ? '|' : '') << digits_ary.join(',')
end

File.open(ARGV[0]).each_line do |line|
  puts separate_words_and_digits(line.strip)
end

# tests
=begin
p separate_words_and_digits('8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21') == 'melon,apricot,peach,pineapple|8,33,21,0,16,50,37,0,7,17,21'
p separate_words_and_digits('24,13,14,43,41') == '24,13,14,43,41'
=end