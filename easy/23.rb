# https://www.codeeval.com/browse/23/

1.upto(12) do |x|
  1.upto(12) do |y|
    prod = (x * y).to_s.rjust(4)
    prod.strip! if y == 1
    print prod
  end
  puts
end