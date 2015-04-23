# https://www.codeeval.com/browse/93/

def capitalize_every_word(str)
  str.split(' ').map { |word| word[0] = word[0].upcase; word }.join(' ')
end

File.open(ARGV[0]).each_line do |line|
  puts capitalize_every_word(line)
end

# tests
=begin
p capitalize_every_word('Hello world') == 'Hello World'
p capitalize_every_word('javaScript language') == 'JavaScript Language'
p capitalize_every_word('a letter') == 'A Letter'
p capitalize_every_word('1st thing') == '1st Thing'
=end