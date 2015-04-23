# https://www.codeeval.com/browse/67/

File.open(ARGV[0]).each_line do |line|
  puts line.strip.to_i(16)
end