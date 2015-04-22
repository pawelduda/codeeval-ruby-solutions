# https://www.codeeval.com/browse/29/

File.open(ARGV[0]).each_line do |line|
  puts line.split(',').map(&:to_i).uniq.join(',')
end
