# https://www.codeeval.com/browse/97/

def get_writer(encoded_str, keyset)
  keyset = keyset.split(' ').map(&:to_i).map { |x| x -= 1 }

  result = []
  keyset.each do |key|
    result << encoded_str[key]
  end

  result.join
end

File.open(ARGV[0]).each_line do |line|
  encoded_str, keyset = line.split('|')
  puts get_writer(encoded_str, keyset)
end

# tests
=begin
p get_writer('osSE5Gu0Vi8WRq93UvkYZCjaOKeNJfTyH6tzDQbxFm4M1ndXIPh27wBA rLclpg', '3 35 27 62 51 27 46 57 26 10 46 63 57 45 15 43 53') == 'Stephen King 1947'
=end
