# https://www.codeeval.com/browse/4/

require 'prime'

sum = 0
Prime.first(1000).each do |x|
  sum += x
end

p sum