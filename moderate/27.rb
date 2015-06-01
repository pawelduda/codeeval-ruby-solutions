# https://www.codeeval.com/browse/27/

File.open(ARGV[0]).each_line { |line| puts line.to_i.to_s(2) }
