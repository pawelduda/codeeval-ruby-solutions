# https://www.codeeval.com/browse/21/

File.open(ARGV[0]).each_line do |line|
  puts line.strip.split('').map(&:to_i).reduce(&:+)
end