# https://www.codeeval.com/browse/96/

File.open(ARGV[0]).each_line do |line|
  puts line.swapcase
end