# https://www.codeeval.com/browse/37/

def missing_alphabets(text)
  letters = text.downcase.split('')
  missing_letters = ('a'..'z').to_a.delete_if { |character| letters.include?(character) }
  missing_letters.empty? ? 'NULL' : missing_letters.join
end

File.open(ARGV[0]).each_line do |line|
  puts missing_alphabets(line)
end

# tests
# p missing_alphabets('A quick brown fox jumps over the lazy dog') == 'NULL'
# p missing_alphabets('A slow yellow fox crawls under the proactive dog') == 'bjkmqz'
