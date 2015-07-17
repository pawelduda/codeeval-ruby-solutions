# https://www.codeeval.com/browse/14/

def string_permutations(stringish)
  stringish.split('').permutation.map(&:join).sort.join(',')
end

File.open(ARGV[0]).each_line do |line|
  puts string_permutations(line.strip)
end

# tests
# p string_permutations('hat') == 'aht,ath,hat,hta,tah,tha'
# p string_permutations('abc') == 'abc,acb,bac,bca,cab,cba'
# p string_permutations('Zu6') == '6Zu,6uZ,Z6u,Zu6,u6Z,uZ6'
