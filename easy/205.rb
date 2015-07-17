# https://www.codeeval.com/open_challenges/205/

class String
  def only_words
    self.gsub!(/[^A-Za-z]/, ' ').downcase.strip.squeeze(' ')
  end
end

File.open(ARGV[0]).each_line do |line|
  puts line.only_words
end

# tests
# p '(--9Hello----World...--)'.only_words == 'hello world'
# p 'Can 0$9 ---you~'.only_words == 'can you'
# p '13What213are;11you-123+138doing7'.only_words == 'what are you doing'



