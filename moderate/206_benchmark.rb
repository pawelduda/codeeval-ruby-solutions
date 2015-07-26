# require_relative '206'
require 'benchmark'

Benchmark.bm do |x|
  x.report { ('0'*100)..('9'*100).join('') }
end

# Benchmark.bm do |x|
#   x.report { lucky_tickets_amount_for_length(6) == 55252 }
# end
